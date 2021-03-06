#!/bin/bash
# Sample GPU batch script
# Job parameters
# ----------------------------
#SBATCH --job-name=DF_devicequery
#SBATCH --output=device_query_output.txt
#SBATCH --error=device_query_error.txt

# Job resources
# ----------------------------
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1000
#SBATCH --time=0:01:00
#SBATCH --gres=gpu:2

# Cluster partition / queue
# ----------------------------
# Check partitions: sinfo -a
#SBATCH --partition=debug

# Operations
echo "Job started at $(date)"

# Job steps

# Check Nvidia
nvidia-smi

# Test singularity container
singularity run --nv cuda_device_query.sif

echo "Job completed at $(date)"
