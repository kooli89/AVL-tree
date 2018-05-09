# Install script for directory: /home/kooli/TSP/CSC4508/AVL-tree/cmocka/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  foreach(file
      "$ENV{DESTDIR}/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so.0.4.1"
      "$ENV{DESTDIR}/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so.0"
      "$ENV{DESTDIR}/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "")
    endif()
  endforeach()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so.0.4.1;/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so.0;/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib" TYPE SHARED_LIBRARY FILES
    "/home/kooli/TSP/CSC4508/AVL-tree/cmocka/build/src/libcmocka.so.0.4.1"
    "/home/kooli/TSP/CSC4508/AVL-tree/cmocka/build/src/libcmocka.so.0"
    "/home/kooli/TSP/CSC4508/AVL-tree/cmocka/build/src/libcmocka.so"
    )
  foreach(file
      "$ENV{DESTDIR}/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so.0.4.1"
      "$ENV{DESTDIR}/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so.0"
      "$ENV{DESTDIR}/home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

