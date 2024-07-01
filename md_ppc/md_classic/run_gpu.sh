#!/bin/bash
#PBS -N md_wt
#PBS -q gpuq
#PBS -l select=1:ncpus=10:ngpus=1
#PBS -V
. /opt/ohpc/pub/apps/amber/amber20/amber.sh

cd $PBS_O_WORKDIR  

########################################################################################

pmemd.cuda -O -i $PWD/min1.in -o min1.out -p pep.top -c pep.crd  -r min1.rst -ref pep.crd
pmemd.cuda -O -i $PWD/min2.in -o min2.out -p pep.top -c min1.rst -r min2.rst 
pmemd.cuda -O -i $PWD/md0.in  -o md0.out  -p pep.top -c min2.rst -r md0.rst  -ref min2.rst -x md0.nc
pmemd.cuda -O -i $PWD/md1.in  -o md1.out  -p pep.top -c md0.rst  -r md1.rst  -ref md0.rst -x md1.nc
#pmemd.cuda -O -i $PWD/md2.in  -o md2.out  -p pep.top -c md1.rst  -r md2.rst  -x md2.nc
#pmemd.cuda -O -i $PWD/md3.in  -o md3.out  -p pep.top -c md2.rst  -r md3.rst  -x md3.nc
#pmemd.cuda -O -i $PWD/md4.in  -o md4.out  -p pep.top -c md3.rst  -r md4.rst  -x md4.nc


#########################################################################################


