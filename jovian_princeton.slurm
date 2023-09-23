#!/bin/bash

# Launch Jupyter

#SBATCH --job-name=jovian_princeton
#SBATCH --partition=math-alderaan
#SBATCH --time=3-00:00:00
#SBATCH --ntasks=32
#SBATCH --output=slurm_%u_%x_%A.out

# Source: https://researchcomputing.princeton.edu/support/knowledge-base/jupyter#sbatch

# get tunneling info
XDG_RUNTIME_DIR=""
node=$(hostname -s)
node_ip=$(hostname -i)
user=$(whoami)
cluster="math-alderaan"
port=8889

# print tunneling instructions jupyter-log
echo -e "
Command to create ssh tunnel:
ssh -N -f -L ${port}:${node}:${port} ${user}@${cluster}.ucdenver.pvt

Use a Browser on your local machine to go to:
localhost:${port}  (prefix w/ https:// if using password)

node name: ${node}
node ip: ${node_ip}
"

# load modules or conda environments here
#conda init bash
source ~/.bashrc
#conda activate nest
micromamba activate nest  # Recreated the environment using micromamba because conda takes way too long.

# Run Jupyter
jupyter-lab --no-browser --port=${port} --ip=${node}

