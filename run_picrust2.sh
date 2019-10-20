#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=28:mem=168gb
#PBS -l walltime=02:00:00
#PBS -M aponsero@email.arizona.edu
#PBS -m bea

source activate picrust2

DIR="/rsgrps/bhurwitz/alise/my_data/NEC_babies/2Picrust2_analysis/data"
OUT="$DIR/picrust2_out_pipeline"

BIOM="$DIR/table.biom"
ASV="$DIR/ASVs.fa"

#verify biom table
#biom summarize-table -i $BIOM > $OUT/summ_biom.txt

#place in tree
#place_seqs.py -s $ASV -o $OUT/out.tre -p 12

#hsp.py -i 16S -t $OUT/out.tre -o $OUT/marker_predicted_and_nsti.tsv.gz -p 12 -n
#hsp.py -i EC -t $OUT/out.tre -o $OUT/EC_predicted.tsv.gz -p 12
#hsp.py -i KO -t $OUT/out.tre -o $OUT/KO_predicted.tsv.gz -p 12

#metagenome_pipeline.py -i $BIOM -m $OUT/marker_predicted_and_nsti.tsv.gz -f $OUT/EC_predicted.tsv.gz -o $OUT/EC_metagenome_out --strat_out

#metagenome_pipeline.py -i $BIOM -m $OUT/marker_predicted_and_nsti.tsv.gz -f $OUT/KO_predicted.tsv.gz -o $OUT/KO_metagenome_out --strat_out

#pathway_pipeline.py -i $OUT/EC_metagenome_out/pred_metagenome_contrib.tsv.gz -o $OUT/EC_metagenome_out/pathways_out -p 12

add_descriptions.py -i $OUT/EC_metagenome_out/pred_metagenome_unstrat.tsv.gz -m EC \
                    -o $OUT/EC_metagenome_out/pred_metagenome_unstrat_descrip.tsv.gz

add_descriptions.py -i $OUT/EC_metagenome_out/pathways_out/path_abun_unstrat.tsv.gz -m METACYC \
                    -o $OUT/EC_metagenome_out/pathways_out/path_abun_unstrat_descrip.tsv.gz

add_descriptions.py -i $OUT/KO_metagenome_out/pred_metagenome_unstrat.tsv.gz -m KO \
                    -o $OUT/KO_metagenome_out/pred_metagenome_unstrat_descrip.tsv.gz







