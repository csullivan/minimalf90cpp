program main
  use test ! inclusive import  -  using the test module defined in func.F90. This is like a python  "from module import *"
  !use test, only : func  ! exclusive import
  implicit none
  integer ii

  ii=2
  print*,"x, x**2",ii,func(ii)

end program main
