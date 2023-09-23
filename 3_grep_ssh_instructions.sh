cat $(ls | grep slurm_jovian.out) | grep -A 9 -B 2 ssh
cat $(ls | grep slurm_jovian.out) | grep 127.0.0.1