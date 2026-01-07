#!/bin/bash
#SBATCH -J WaveQLab3D        # Job name
#SBATCH -o waveqlab3d.%j.out # Output file (%j is job ID)
#SBATCH -e waveqlab3d.%j.err # Error file
#SBATCH -t 48:00:00          # Time limit
#SBATCH -N 1                 # Number of nodes
#SBATCH -n 40                # Number of tasks (MPI processes)
#SBATCH -p medium           # Queue (partition)
#SBATCH --mail-type=ALL      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aimran@miners.utep.edu   # Email notifications

# Load necessary modules
module purge
module load compiler-rt/2024.0.0
module load ifort/2024.0.0
module load mpi/2021.13

export I_MPI_FABRICS=shm:tcp
export I_MPI_OFI_PROVIDER=tcp


# Define variable
CASE_NAME="upwind-drp_3_pml-off_elastic_B_mq"

# Run the application
mpirun -np 40 ../../build/./waveqlab3d ${CASE_NAME}.in > ${CASE_NAME}.out

# Define variable
CASE_NAME="upwind-drp_4_pml-off_elastic_B_mq"

# Run the application
mpirun -np 40 ../../build/./waveqlab3d ${CASE_NAME}.in > ${CASE_NAME}.out

# Define variable
CASE_NAME="upwind-drp_5_pml-off_elastic_B_mq"

# Run the application
mpirun -np 40 ../../build/./waveqlab3d ${CASE_NAME}.in > ${CASE_NAME}.out

# Define variable
CASE_NAME="upwind-drp_6_pml-off_elastic_B_mq"

# Run the application
mpirun -np 40 ../../build/./waveqlab3d ${CASE_NAME}.in > ${CASE_NAME}.out

# Define variable
CASE_NAME="upwind-drp_7_pml-off_elastic_B_mq"

# Run the application
mpirun -np 40 ../../build/./waveqlab3d ${CASE_NAME}.in > ${CASE_NAME}.out