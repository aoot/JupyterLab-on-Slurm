#!/bin/bash

cd ~/scripts_jupyterlab/

rm slurm*

sbatch jovian_princeton.slurm

sleep 3

cat $(ls | grep ^slurm*) | grep ssh
