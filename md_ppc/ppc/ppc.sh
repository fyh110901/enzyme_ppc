#!/bin/bash

#PBS -N ppc193_32_1H
#PBS -q workq
#PBS -l select=1:ncpus=40
#PBS -V
. /opt/ohpc/pub/apps/amber/amber20/amber.sh

cd $PBS_O_WORKDIR
#############################################

#source /share/apps/amber18-cpu/amber.sh
source /home/zcx/intel/oneapi/setvars.sh
#gasuuian16
export g16root=/home/zcx/apps/gaussian
source $g16root/g16/bsd/g16.profile
export GAUSS_SCRDIR=$g16root/tmp

np=40

mpirun  -np ${np} ./MFCC-mpi <peptide_pb0.inp >& peptide_pb0.out
cp qvalue.dat qvalue.dat.0
cp delphi.log delphi.log.0

mpirun  -np ${np} ./MFCC-mpi <peptide_fitcharge0.inp >& peptide_fitcharge0.out
cp peptide.out.pdb peptide.out.pdb.0

for i in `seq 1 5`
do
  mpirun  -np ${np} ./MFCC-mpi <peptide_pb.inp >& peptide_pb.out.$i
  cp qvalue.dat qvalue.dat.$i
  cp delphi.log delphi.log.$i

  mpirun  -np ${np} ./MFCC-mpi <peptide_fitcharge.inp >& peptide_fitcharge.out.$i
  cp peptide.out.pdb peptide.out.pdb.$i

done

rm 0*

