# Install script for directory: /home/kooli/Desktop/TSP-2A/CSC4508/cmocka

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/install")
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pkgconfig")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/install/lib/pkgconfig/cmocka.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/install/lib/pkgconfig" TYPE FILE FILES "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/cmocka.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "devel")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/install/lib/cmake/cmocka/cmocka-config.cmake;/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/install/lib/cmake/cmocka/cmocka-config-version.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/install/lib/cmake/cmocka" TYPE FILE FILES
    "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/cmocka-config.cmake"
    "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/cmocka-config-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/doc/cmake_install.cmake")
  include("/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/include/cmake_install.cmake")
  include("/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/src/cmake_install.cmake")
  include("/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/example/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/kooli/Desktop/TSP-2A/CSC4508/cmocka/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
