library(shiny)
library(ggplot2)
library(dplyr)
library(biomformat)

seqtab.nochim <- read.table("from_Daniel/asv_table.txt", stringsAsFactors = FALSE)

# giving our seq headers more manageable names (ASV_1, ASV_2...)
asv_seqs <- colnames(seqtab.nochim)
asv_headers <- vector(dim(seqtab.nochim)[2], mode="character")

for (i in 1:dim(seqtab.nochim)[2]) {
  asv_headers[i] <- paste(">ASV", i, sep="_")
}

# making and writing out a fasta of our final ASV seqs:
asv_fasta <- c(rbind(asv_headers, asv_seqs))
write(asv_fasta, "ASVs.fa")

# count table:
asv_tab <- t(seqtab.nochim)
row.names(asv_tab) <- sub(">", "", asv_headers)
write.table(asv_tab, "ASVs_counts.tsv", sep="\t", quote=F, col.names=NA)

#create biom table
st.biom <- make_biom(asv_tab)
write_biom(st.biom, "NEC.biom")

read_biom("NEC.biom")
