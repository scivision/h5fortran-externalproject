cmake_minimum_required(VERSION 3.20)

project(H5fortran_example
LANGUAGES C Fortran
)

enable_testing()

include(FetchContent)

option(h5fortran_BUILD_TESTING "h5fortran internal tests")

set(CMAKE_TLS_VERIFY true)
set(FETCHCONTENT_UPDATES_DISCONNECTED_H5FORTRAN true)

# --- auto-ignore build directory
if(NOT EXISTS ${PROJECT_BINARY_DIR}/.gitignore)
  file(WRITE ${PROJECT_BINARY_DIR}/.gitignore "*")
endif()

# --- build h5fortran (requires HDF5 library)

FetchContent_Declare(h5fortran
GIT_REPOSITORY https://github.com/geospace-code/h5fortran.git
GIT_TAG v4.6.3
)

FetchContent_MakeAvailable(H5FORTRAN)

file(MAKE_DIRECTORY ${h5fortran_BINARY_DIR}/include)
# avoids race condition on first configure

# Example main program using h5fortran

add_executable(demo app/main.f90)
target_link_libraries(demo PRIVATE h5fortran::h5fortran)
add_test(NAME DemoH5fortran COMMAND demo)
