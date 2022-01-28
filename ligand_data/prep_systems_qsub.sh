#!/bin/sh
#PBS -l walltime=12:00:00 # owlsnest::48:00:00, cb2rr::24:00:00
#PBS -N restraint-lig-parm
#PBS -q gpu        # owlsnest::large/qcd, cb2rr:gpu
#PBS -l nodes=1:ppn=1 # owlsnest::1:2, cb2rr::1:4
#PBS -o restraint-lig-parm
#PBS

cd $PBS_O_WORKDIR

. ~/.bashrc # removing may cause 'conda init' error
conda activate openff     # activate env with: python==3.7 openmm==7.5.0 openforcefield openmmforcefields
module load cuda/10.0.130   # owlsnest::cuda/10, cb2rr::cuda/10.0.130

# ~/path/to/anaconda/env/python simulate.py start end gpu_id

~/anaconda3/envs/openff/bin/python simulate.py 0 22 0 &

wait
