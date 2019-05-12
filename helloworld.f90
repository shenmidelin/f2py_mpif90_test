!
! $ f2py --f90exec=mpif90 -m helloworld -c helloworld.f90
!

subroutine sayhello(comm)
  use mpi
  implicit none
  integer :: comm
  integer :: rank, size, nlen, ierr
  character (len=MPI_MAX_PROCESSOR_NAME) :: pname

  integer :: num

  if (comm == MPI_COMM_NULL) then
     print *, 'You passed MPI_COMM_NULL !!!'
     return
  end if
  call MPI_Comm_rank(comm, rank, ierr)
  call MPI_Comm_size(comm, size, ierr)
  call MPI_Get_processor_name(pname, nlen, ierr)
  !print *, 'Hello, World!', &
  !     ' I am process ', rank, &
  !     ' of ', size, &
  !     ' on ', pname(1:nlen), '.'

  open(100, file='config.in')
  read(100, *) num
  print *, "num: ", num

end subroutine sayhello

