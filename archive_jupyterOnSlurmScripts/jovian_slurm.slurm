#!/bin/bash

# Launch Jupyter

#SBATCH --job-name=jovian_slurm
#SBATCH --partition=math-alderaan
#SBATCH --time=3-00:00:00
#SBATCH --ntasks=16
#SBATCH --output=slurm_%u_%x_%A.out

# Activate the proper conda env
source /home/leean9/.bashrc
conda activate nest
conda env list

# Spacing
echo "########## ########## ##########"
# Print out host info
cat /etc/hosts

# Print hostname info
echo "########## ########## ##########"
uname -n  # Hostname
ifconfig | grep inet
echo "########## ########## ##########"

# Spacing
echo "########## ########## ##########"
# Launch Jupyterlab
jupyter lab --no-browser \
	    --ip="0.0.0.0"  \
	    --notebook-dir /home/leean9
