#!/bin/bash
#SBATCH --job-name=jupyter_stanford
#SBATCH --partition=math-alderaan
#SBATCH --time=2:00:00
#SBATCH --ntasks=1
#SBATCH --output=/home/leean9/jupyter_stanford.log
#SBATCH --exclude=math-alderaan-c[12,23]

conda activate test_jupyterlab
cat /etc/hosts
jupyter lab --ip=0.0.0.0 --port=8888
