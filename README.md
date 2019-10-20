# 16S_Picrust
Scripts for 16S analysis and Picrust2 predictions

## Dada2.R script
Requirements : 
* dada2 (http://benjjneb.github.io/dada2/index.html)

Run Dada2 read QC, denoising, merging and chimera detection. Then run a taxonomic assignment of the created ASVs against the SILVA database.

## Picrust2 script
Requirements: 
* Picrust2 (https://github.com/picrust/picrust2/wiki)
* Biomformat (https://www.bioconductor.org/packages/release/bioc/html/biomformat.html)

Run Picrust2 using the ASVs from Dada2 (script to convert Dada2 traditional output into biom using biomformat available in other_scripts folder). Generates gene abundance predictions using EC and KO annotations. Generates MetaCyc pathway predictions.

