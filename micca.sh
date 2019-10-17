#!/bin/bash

#load tools and make sure that the PATHS are set correctly
source /rsgrps/bhurwitz/alise/tools/virtual_env_python/bin/activate
export PYTHONPATH=$PYTHONPATH:/rsgrps/bhurwitz/alise/tools/micca/module/lib/python3.5/site-packages
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cm/shared/uaapps/python/3.5.5/lib/
MICCA="/rsgrps/bhurwitz/alise/tools/micca/micca-1.7.2/scripts"

# go to directory
DIR="/rsgrps/bhurwitz/alise/my_data/NEC_babies/Picrust_analysis/dataset_NEC"
cd $DIR

for fw in *_F_filt.fastq
do
    base=${fw%_F_filt.fastq}
    rev="${base}_R_filt.fastq"
    python $MICCA/micca mergepairs -i $fw -r $rev -o ${base}_merged.fastq -l 8 -d 4
    sed '/^@/!d;s//>/;N' ${base}_merged.fastq > ${base}_merged.fasta
done    

