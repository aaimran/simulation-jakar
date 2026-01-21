# Load necessary modules
module purge
module load intel/19.1.1
module load impi/19.0.9


#ibrun ../../build/./waveqlab3d traditional_6_pml-off_elastic_B_mq.in > traditional_6_pml-off_elastic_B_mq.out

# Define variable
CASE_NAME=traditional_6_pml-off_elastic_B_mq

# Run the application
ibrun ../../build/./waveqlab3d ${CASE_NAME}.in | tee ${CASE_NAME}.out


# Define variable
CASE_NAME=traditional_6_pml-off_anelastic-c2_B_mq

# Run the application
ibrun ../../build/./waveqlab3d ${CASE_NAME}.in | tee  ${CASE_NAME}.out

# Define variable
CASE_NAME=traditional_6_pml-on_elastic_B_mq

# Run the application
ibrun ../../build/./waveqlab3d ${CASE_NAME}.in | tee ${CASE_NAME}.out


# Define variable
CASE_NAME=traditional_6_pml-on_anelastic-c2_B_mq

# Run the application
ibrun ../../build/./waveqlab3d ${CASE_NAME}.in | tee ${CASE_NAME}.out