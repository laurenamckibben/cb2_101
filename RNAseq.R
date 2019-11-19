BiocManager::install("DESeq2") 
BiocManager::install("edgeR") 

library(stringr)
library(Biostrings)
library(DESeq2)
library(edgeR)


raw.data<-read.table("./pnas_expression.txt", header=T)
head (raw.data)
counts<-raw.data[,-ncol(raw.data)]
head (counts)
rownames(counts)<-counts$ensembl_ID
counts<-counts[,-1]
colnames(counts)<-paste(c(rep("C_R",4), rep("T_R",3)),c(1:4,1:3), sep="")

library(edgeR)
group<-c(rep("C", 4), rep("T", 3))
cds<-DGEList(counts, group=group)
cds<-calcNormFactors(cds)
design<-model.matrix(~group)
y<-estimateDisp(cds,design)
fit<-glmQLFit(y,design)
qlf<-glmQLFTest(fit,coef=2)
topTags(qlf)


counts$C_R1
quantile(counts$C_R1, .75)
counts$C_R1/quantile(counts$C_R1, .75)

counts<-counts+1
counts<-log2(counts)
head(counts)
counts<-t(counts)          
d.pca<-prcomp(counts)
plot(d.pca, type="l")
summary(d.pca)


counts1<-t(counts)
d.pca1<-prcomp(counts1)
plot(d.pca1, type="l")

d.pca$sdev
d.pca$x
plot(d.pca$x[,1], d.pca$x[,2],col=as.factor(group))
