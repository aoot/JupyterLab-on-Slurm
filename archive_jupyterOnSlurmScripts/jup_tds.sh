#!/bin/bash

# Launch Jupyter

#SBATCH --job-name=jup_tds
#SBATCH --partition=math-alderaan
#SBATCH --time=3-00:00:00
#SBATCH --ntasks=1
#SBATCH --output=/home/leean9/jup_tds.log

# Activate the proper conda env
source /home/leean9/.bashrc
conda activate test_jupyterlab
conda env list

echo " "

cat /etc/hosts

echo " " 

jupyter lab --no-browser \
	    --ip="*"  \
	    --notebook-dir /home/leean9
