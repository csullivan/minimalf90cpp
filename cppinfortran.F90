program main
  use test

  implicit none
  integer ii
  real*8 :: cfunc ! forward declare a function (linked in from c++)


  ii=2
  print*,"x, x**2",ii,cfunc(ii)

end program main
