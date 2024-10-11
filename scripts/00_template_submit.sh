#!/bin/sh

## One sentence about what the script does!

#SBATCH --partition=compute
#SBATCH --job-name=ENTER-JOB-NAME
#SBATCH --account=sc-users
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=64G
#SBATCH --array=1-30%15
#SBATCH --output=</PATH/TO/>slurm_logs/%x-%A-%2a.out

## change directory

PROJECT_DIR='</PATH/TO/PROJECT/>'
cd $PROJECT_DIR

## Use Array Index to select features
echo "[LOG] Array Job ID: $SLURM_ARRAY_JOB_ID"
echo "[LOG] Array Task ID: $SLURM_ARRAY_TASK_ID"
echo "[LOG] Job ID: $SLURM_JOB_ID"
echo "[LOG] Node ID: $SLURM_NODEID"
echo "[LOG] Node List: $SLURM_NODELIST"
echo "[LOG] Job ID: $SLURM_ARRAY_TASK_ID"
input="$(awk -v var=$SLURM_ARRAY_TASK_ID -F ',' 'NR == var+1 {print $1}' </PATH/TO/>MASTER_FILE.csv)"
output="$(awk -v var=$SLURM_ARRAY_TASK_ID -F ',' 'NR == var+1 {print $2}' </PATH/TO/>MASTER_FILE.csv)"

## Do some logging
echo "[LOG] Running script with ${input} as input and ${output} as output"
printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "[LOG] Starting script at: $date"

## This is the container to be used
R_CONTAINER='</PATH/TO/>/all-inclusive-rstudio-apptainer/sif/all_inclusive_rstudio_4.3.1.sif'

# This is the script that is executed
# Get with rstudioapi::getSourceEditorContext()$path
R_SCRIPT='</PATH/TO/>SCRIPT.R'

# Enter all directories you need, simply in a comma-separated list
BIND_DIR="</DIR/TO/MOUNT/1/>,</DIR/TO/MOUNT/2>"

## The container 
singularity exec \
  --bind $BIND_DIR \
  $R_CONTAINER Rscript $R_SCRIPT ${input} ${output}

## Some more logging
printf -v date '%(%Y-%m-%d %H:%M:%S)T\n' -1
echo "[LOG] Finishing script at: $date"
echo "[LOG] Done!"
exit $(echo $?)
