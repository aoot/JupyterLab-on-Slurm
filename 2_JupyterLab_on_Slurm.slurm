#!/bin/bash

## Slurm script to launch JupyterLab to SSH to via srun
## Source: https://researchcomputing.princeton.edu/support/knowledge-base/jupyter#sbatch

## Please refer to your cluster's documentation for details on how to set up the
## parameters. Different clusters are configured differently to prefer users to 
## specify different parameters. 

#SBATCH --job-name=jovian
#SBATCH --partition=math-alderaan
#SBATCH --time=08:00:00
#SBATCH --ntasks=32
#SBATCH --output=slurm_jovian.out


## Get info for tunneling
node=$(hostname -s)      # Gather the short hostname
node_ip=$(hostname -i)   # Gather the host IP
user=$(whoami)           # Gather the username

## Variables here differ from different clusters
cluster="math-alderaan"  # Specify the cluster node
port=8889                # Specify the port to use - Make sure it is unused!

## Print tunneling instructions into the slurm output
echo -e "
################################################################################
Command to create SSH tunnel from local machine:
  ssh -N -f -L ${port}:${node}:${port} ${user}@${cluster}.ucdenver.pvt

Use a Browser on your local machine to go to:
  localhost:${port}  (prefix w/ https:// if using password)

node name: ${node}
node ip: ${node_ip}
################################################################################
"

## Load modules / Activate conda environment
source ~/.bashrc
conda activate JupyterLab_on_slurm

## Run JupyterLab
jupyter-lab --no-browser --port=${port} --ip=${node_ip}