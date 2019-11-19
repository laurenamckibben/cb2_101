#call these packages
suppressPackageStartupMessages(library(Biostrings))
suppressPackageStartupMessages(library (stringr))


#call the three variables 
args<-commandArgs(trailingOnly = T)
#fasta<-"NGS/hmmer/hmmer-3.2.1/p53_clean.fas"
fasta<-args[1]
#ids<-"required.ids"
ids<-args[2]
outfile<-args[3]
# ids<-read.table(ids, stringsAsFactors = F, header = F, fill=T)
# ids<-ids[ids$V1=="460", ]
# ids<-ids$V6[c(1,2)]
# write.table(ids,"required.ids", quote=F, row.names = F, col.names = F)


##Reads fasta and extract IDS
seqs<- readAAStringSet(fasta)

idset<-names(seqs)

#pattern<-"^\\S+\\_+\\S\\."
pattern<-"^(\\S+)\\."
matches<-str_match(idset,pattern)
idset<-matches[,2]

#Read required ID files
required_ids<-read.table(ids, stringsAsFactors = F, header=F)
matches<-str_match(required_ids$V1, pattern=pattern)
required_ids<-matches[,2]

#Whic ids matchs
matching_index<-which(idset %in% required_ids)

#subset the fasta files
seq_subset<-seqs[matching_index]
#write out the subset as a fast a file
writeXStringSet(seq_subset, outfile)

