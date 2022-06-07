cmake_minimum_required(VERSION 3.20)

project(H5fortran_example
LANGUAGES C Fortran
)

enable_testing()

include(FetchContent)

option(h5fortran_BUILD_TESTING "h5fortran internal tests")

set(CMAKE_TLS_VERIFY true)
set_directory_properties(PROPERTIES EP_UPDATE_DISCONNECTED true)

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
  # will not take effect without FORCE
  # CMAKE_BINARY_DIR in case it's used from FetchContent
  set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR} CACHE PATH "Install top-level directory" FORCE)
endif()

# Find HDF5
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules)

find_package(HDF5 COMPONENTS Fortran REQUIRED)

# --- auto-ignore build directory
if(NOT EXISTS ${PROJECT_BINARY_DIR}/.gitignore)
  file(WRITE ${PROJECT_BINARY_DIR}/.gitignore "*")
endif()

# --- build h5fortran (requires HDF5 library)
include(h5fortran.cmake)

# Example main program using h5fortran

add_executable(demo app/main.f90)
target_link_libraries(demo PRIVATE h5fortran::h5fortran)
add_test(NAME DemoH5fortran COMMAND demo)
