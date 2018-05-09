get_filename_component(CMOCKA_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)

if (EXISTS "${CMOCKA_CMAKE_DIR}/CMakeCache.txt")
    # In build tree
    include(${CMOCKA_CMAKE_DIR}/cmocka-build-tree-settings.cmake)
else()
    set(CMOCKA_INCLUDE_DIR /home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/include)
endif()

set(CMOCKA_LIBRARY /home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so)
set(CMOCKA_LIBRARIES /home/kooli/TSP/CSC4508/AVL-tree/cmocka/install/lib/libcmocka.so)
