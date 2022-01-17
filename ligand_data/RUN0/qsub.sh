#!/bin/bash
#PBS -N harmonic_ee_RUN0.pf
#PBS -o harmonic_ee_RUN0.out
#PBS -q normal
#PBS -l nodes=1:ppn=16
#PBS -l walltime=48:00:00
#PBS -j oe
#PBS

cd $PBS_O_WORKDIR

export OMP_NUM_THREADS=1

module load gromacs
module load mpi/openmpi

mpirun mdrun_mpi -maxh 47.8 -s prod.tpr -cpi state.cpt

