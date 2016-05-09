! A fortran module, when compiled a .mod is produce which is passed to the linker
module test
  implicit none

contains
  function func(x) result(val)
    implicit none
    integer :: x
    integer :: val
    val = x*x
  end function func
end module test
