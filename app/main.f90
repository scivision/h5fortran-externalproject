program demo

use h5fortran, only : h5write, h5read

implicit none (type, external)

integer :: x, y

x = 42


call h5write('test.h5', '/x', x)

call h5read('test.h5', '/x', y)

if (y /= x) error stop "x was not written correctly or y was not read correctly"

print *, "OK: h5write, h5read from h5fortran"

end program
