# h5fortran example via CMake FetchContent

Example of using
[h5fortran](https://github.com/geospace-code/h5fortran)
via CMake
[FetchContent](https://cmake.org/cmake/help/latest/module/FetchContent.html).

This example will download and build h5fortran.
It requires HDF5 library.

```sh
cmake -B build

cmake --build build

# optional
ctest --test-dir build
```
