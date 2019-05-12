#!/usr/bin/env python

# after importing numpy, it seems that Fortran cannot open file on OSX
# comment out it, it works normally
import numpy

from mpi4py import MPI
import helloworld as hw

comm = MPI.COMM_WORLD
fcomm = comm.py2f()
hw.sayhello(fcomm)
