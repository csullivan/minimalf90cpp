
# gnu fortran compiler
F90=gfortran

# gnu c++ compiler
CPP=g++

# fortran flags
F90FLAGS=-O3 -ffree-line-length-none

# c++ flags
CPPFLAGS=-O3 -std=c++11

# module include directory (for .mod files)
MODINC=-I./

# explicit list of sources
F90SOURCES=func.F90
CPPSOURCES=cfunc.cc

# only needed for mixing c++ into fortran
LDFLAGS=-lstdc++


F90OBJECTS=$(F90SOURCES:.F90=.o )
CPPOBJECTS=$(CPPSOURCES:.cc=.o )

all: fortranonly cppinfortran

fortranonly:  $(F90OBJECTS)
	$(F90) $(F90FLAGS) $(DEFS) $(MODINC) $(F90OBJECTS) fortranonly.F90 -o $@

cppinfortran:  $(CPPOBJECTS)
	$(F90) $(F90FLAGS) $(DEFS) $(MODINC) $(CPPOBJECTS) $(LDFLAGS) cppinfortran.F90 -o $@

$(CPPOBJECTS): %.o: %.cc $(EXTRADEPS)
	$(CPP) $(CPPFLAGS) $(MODINC) $(EXTRAINCS) -c $<

$(F90OBJECTS): %.o: %.F90 $(EXTRADEPS)
	$(F90) $(F90FLAGS) $(MODINC) $(EXTRAINCS) -c $<


clean:
	rm -rf *.o
	rm -rf *.mod
	rm -rf *~
	rm -rf fortranonly
	rm -rf cppinfortran
