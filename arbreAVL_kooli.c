#include<stdio.h>
#include<stdlib.h>
#include <assert.h>
#include "arbreAVL.h"

/* Fonction utilitaire pour recuperer la hauteur d'un arbre
   NB : Renvoie 0 si node est NULL
*/
int height(struct Node *node)
{
  if (!node)
    return 0;
  return node->height;
}

/* Fonction utilitaire renvoyant le maximum de deux entiers
 */
int max(int a, int b)
{
  return (a > b)? a : b;
}

/* Procedure qui recalcule le champs height de node a partir de la
   hauteur de ses noeuds fils
*/
void updateHeight(struct Node *node) {
  if(node == NULL) return;
  updateHeight(node->left);
  updateHeight(node->right);
  node->height = 1 + max(height(node->left) , height(node->right));
  // Conseil : combinez les fonction height() et max() pour simplifier le codage de updateHeight()
}

/* Fonction renvoyant le nombre de noeuds dans le sous-arbre node
   NB : Renvoie 0 si l'arbre ne contient pas de noeud
*/
int nbNode(const struct Node* node)
{
  if(node == NULL) return 0;
  return 1 + nbNode(node->left) + nbNode(node->right);
}

/* Fonction liberant tous les elements du sous-arbre node
   (y compris node)
   Renvoie systematiquement NULL
*/
struct Node *release(struct Node *node)
{
  if(node == NULL) return NULL;
  release(node->left);
  release(node->right);
  free(node->key);
  node->key = NULL;
  free(node->value);
  node->value = NULL;
  free(node);
  node = NULL;
  return NULL;
}

/* Fonction (interne) pour creer un noeud pour stocker la cle
   NB :
      - La cle est recopiee dans une zone memoire allouee dans newNode
      - Les pointeurs left et right sont a NULL
      - Le champ height est initialise a 1 (ce noeud est considere comme
        une feuille autonome).
*/
static struct Node* newNode(const char *key , const char* value)
{
  struct Node* node = malloc(sizeof(struct Node));
  if(node == NULL) 
  {
    puts("NULL pointer");
    return NULL;
  }
  node->key = malloc(strlen(key) + 1);
  if(node->key == NULL) 
  {
    puts("NULL pointer");
    return NULL;
  }
  strcpy((node->key),key);
  node->value = malloc(strlen(value) + 1);
  if(node->value == NULL) 
  {
    puts("NULL pointer");
    return NULL;
  }
  strcpy(node->value , value);
  node->left = node->right = NULL;
  node->height = 1;
  return node;
}

/* Fonction recursive qui insere key dans le sous-arbre de racine node.
   Renvoie la nouvelle racine de ce sous-arbre.
   NB : 1) un arbre binaire ne contient jamais deux fois la meme valeur.
           De ce fait, si la valeur existe deja, insert renvoie node, sans creer
           de nouveau noeud.
        2) Si node vaut NULL, renvoie un arbre constitue uniquement d'un noeud
           contenant cet arbre.
*/

/* Fonction renvoyant la balance d'un noeud
  (0 si le noeud est NULL)
*/
int balance(struct Node *node)
{
  return node == NULL ? 0 :(height(node->right) - height(node->left));
}

static void swap(struct Node *z, struct Node *y);

static struct Node *rightRotate(struct Node *z)
{
  struct Node* y = z->left;
  struct Node* T3 = y->right;
  swap(z,y);
  y->left = T3;
  z->right = y;
  return z;
}

static struct Node *leftRotate(struct Node *z)
{
  struct Node* y = z->right;
  struct Node* T2 = y->left;
  swap(z,y);
  y->right = T2;
  z->left = y;
  return z;
}

struct Node* insert(struct Node* node, const char* key,const char* value)
{
  if(node == NULL) return newNode(key,value);   // arbre constitue uniquement d'un noeud contenant cet arbre
  int cmp = strcmp(key,node->key);
  if(!cmp) // les clés sont les memes
  {
    node->value = realloc(node->value, strlen(value) + 1);
    if((node->value) == NULL)
    {
      puts("NULL pointer, Insertion failed");
      return node;
    }
    strcpy(node->value , value);
    return node;
  }
  else if(cmp < 0)
  {
    node->left = insert(node->left , key, value);
  }
  else
  {
    node->right = insert(node->right , key, value);
  }
  updateHeight(node);
  int node_balance = balance(node);
  if(node_balance<-1)
  {
    if(height(node->left->left) > height(node->left->right)) // left-left case
      node = rightRotate(node);
    else // left-right case
    {
      node->left = leftRotate(node->left);
      node = rightRotate(node);
    }
    updateHeight(node);
  }
  else if(node_balance>1)
  {
    if(height(node->right->right) > height(node->right->left)) // right-right case
      node = leftRotate(node);
    else // right-left case
    {
      node->right = rightRotate(node->right);
      node = leftRotate(node);
    }
    updateHeight(node);
  }
  return node;
}

/* Fonction renvoyant la hauteur de la cle key dans le sous-arbre node.
   NB : Renvoie 0 si la cle n'a pas ete trouvee
*/

struct Node* propagate(struct Node* node, const char *key)
{
  if(node == NULL) return NULL;
  int cmp = strcmp(key,node->key);
  if(!cmp) return node;
  if(cmp<0) return propagate(node->left , key);
  return propagate(node->right , key);
}

int getKeyHeight(struct Node* node, const char *key)
{
  node = propagate(node,key);
  if(node == NULL) return 0;
  return height(node);
}

/* Fonction renvoyant le rang de la cle key dans le sous-arbre node.
   Par exemple :
     - Renvoie 0 si le noeud de la cle key est le noeud le plus en bas
       à gauche de l'arbre
     - Renvoie le nombre de noeuds dans l'arbre - 1 si le noeud de la cle
       key est le noeud le plus en bas à droite de l'arbre
   NB : Renvoie -1 si la cle n'a pas ete trouvee
*/
int getKeyRank(const struct Node* node, const char *key)
{
  if(node == NULL) return -1;
  int cmp = strcmp(key,node->key);
  if(!cmp) return nbNode(node->left);
  if(cmp<0) return getKeyRank(node->left , key);
  int key_rank_right_sub_tree  = getKeyRank(node->right , key);
  if(~key_rank_right_sub_tree) // != -1
  {
    return 1 + nbNode(node->left) + key_rank_right_sub_tree;
  }
  return -1;
}

/* Fonction renvoyant la valeur associee a une cle
   (et NULL si la cle n'est pas trouvee)
*/
char *getValue(struct Node *node, const char *key)
{
  node = propagate(node,key);
  if(node == NULL) return NULL;
  return node->value;
}
/* Debugging function which prints the tree
*/
void print(struct Node* node)
{
  if(node == NULL) return;
  printf("Left children of %s\n" , node->key);
  print(node->left);
  printf("End of left children of %s\n" , node->key);
  printf("%s with height %d\n" , node->key , node->height);
  printf("Right children of %s\n" , node->key);
  print(node->right);
  printf("End of right children of %s\n" , node->key);
}

static void swap(struct Node *z, struct Node *y)
{
  if(z==NULL || y==NULL) return;
  char *aux_key = z->key;
  char *aux_value = z->value;
  struct Node *aux_left = z->left;
  struct Node *aux_right = z->right;
  int aux_height = z->height;

  z->key = y->key;
  y->key = aux_key;

  z->value = y->value;
  y->value = aux_value;

  z->left = y->left;
  y->left = aux_left;

  z->right = y->right;
  y->right = aux_right;

  z->height = y->height;
  y->height = aux_height;

}
