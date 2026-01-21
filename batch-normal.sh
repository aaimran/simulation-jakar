#!/bin/bash
#SBATCH -J WaveQLab3D        # Job name
#SBATCH -o waveqlab3d.%j.out # Output file (%j is job ID)
#SBATCH -e waveqlab3d.%j.err # Error file
#SBATCH -t 48:00:00          # Time limit
#SBATCH -N 40                # Number of nodes
#SBATCH -n 5120              # Number of tasks (MPI processes)
#SBATCH -p normal            # Queue (partition)
#SBATCH --mail-type=ALL      # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aimran@miners.utep.edu,kduru@utep.edu   # Email notifications



# Load necessary modules
module purge
module load intel/19.1.1
module load impi/19.0.9


#------------------- PML off elastic

CASE_NAME="traditional_6_pml-off_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind_6_pml-off_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind-drp_6_pml-off_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

#-------------------- PML Off anelastic-c2

CASE_NAME="traditional_6_pml-off_anelastic-c2"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out
CASE_NAME="upwind_6_pml-off_anelastic-c2"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind-drp_6_pml-off_anelastic-c2"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out


#-------------------- PML On elastic

CASE_NAME="traditional_6_pml-on_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="traditional_6_pml-on_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind_6_pml-on_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind-drp_6_pml-on_elastic"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

#-------------------- PML On anelastic-c2

CASE_NAME="traditional_6_pml-on_anelastic-c2"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind_6_pml-on_anelastic-c2"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwind-drp_6_pml-on_anelastic-c2"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

#------------------- Reference simulation

CASE_NAME="upwwind_6_pml-off_elastic_ref"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwwind_6_pml-on_elastic_ref"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwwind_6_pml-off_anelastic-c2_ref"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

CASE_NAME="upwwind_6_pml-on_anelastic-c2_ref"
mpirun -np 40 ../../build/./waveqlab3d ./input/${CASE_NAME}.in > ./output/${CASE_NAME}.out

# End of script