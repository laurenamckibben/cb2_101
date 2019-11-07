##GGPlot##

#write a data frame
class(iris)

#write out data, this uses a data frame to write. Tell it what data and then what file
write.table(iris, "myiris.tsv")

#read data
myiris<-read.table("myiris.tsv")

#two most common ways to read and write tabular sets of data
write.table(iris, "myiris.tsv", quote=F, header=T, row.names=F)
write.table(iris, "myiris.tsv", quote=F, col.names =T, row.names=F, sep="\t")

#storing a dataset for future use
#save an object
saveRDS(iris, file="myiris.obj.Rds")
myiris_obj<-readRDS("myiris.obj.Rds")

#how to save a graph, once drawn. also multiplot
plot(iris$Sepal.Length, iris$Petal.Length)

#Create a new device to print your images to . 
pdf("testimage.pdg", width=8.5, height=11)
par(mfrow=c(1,2), oma=c(30, 0, 10, 0))
plot(iris$Sepal.Length, iris$Petal.Length)
plot(iris$Sepal.Length, iris$Petal.Length)
dev.off()

BiocManager::install("ggplot2")
library(ggplot2)

#in ggplot you define a variable which stores all of the output from your plot. you can call it whatever you want
#ggplot wants all of your data in the same dataframe
g<-ggplot(iris,aes(x=Sepal.Length, y=Petal.Length))

#add things to your plot with +. You can do this right after your plot or by redefining the g plot as below:
g<-g+
  geom_point()
#to print the plot
print(g)
ggsave("test_ggplot.pdf", g, width=8.5, height=5)  #add things to plot with +. You can do this immediately after making the plot in the same line or redefine the plot as below:
g<-g+
  geom_point()+
  theme_bw()
print(g)

ggsave("test_ggplot.pdf", g, width=8.5, height=5)
saveRDS(g, "test_gg.RDS")
myplot<-readRDS("test_gg.RDS")
myplot<-myplot+theme_dark()
ggsave("test_ggplot.pdf", myplot, with=8.5, height=5)


#Histogram
g<-ggplot(iris, aes(x=Petal.Length))+
  geom_histogram()+
  theme_bw()
print(g)
ggsave("test_ggplot.pdf",g, width=8.5, height=5)


BiocManager::install("tidyr")
library(tidyr)
#Boxplot
data("iris")
subset<-iris[,c(1:4)]
modified_data<-gather(subset)

g<-ggplot(modified_data, aes(x=key, y=value))+
  geom_boxplot()+
  theme_classic()
print(g)
ggsave("test_ggplot.pdf",g, width=8.5,height=5)

#BarPlot
split_iris<-split(iris, iris$Species)
result<-lapply(split_iris,function(x){
  return(data.frame(mean=mean(x$Petal.Width), sd=sd(x$Petal.Width)))
})
result<-do.call(rbind, result)
result$Species<-row.names(result)

g<-ggplot(result, aes(x=Species, y=mean))+
  geom_bar(stat="identity")
ggsave("test_ggplot.pdf", g, width=8.5, height=5 )

g<-g+geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd, width=0.2))
ggsave("test_ggplot.pdf", g, width=8.5, height=5 )


#Grouped barplot
data("mtcars")
g<-ggplot(mtcars,aes(x=factor(gear), fill=factor(cyl)))+
  geom_bar(position=position_dodge())+
  scale_fill_brewer(palette = "Blues")+
  labs(x="Gears", y="Count", fill="Cylinders", title="Car cylinder and gear counts")

ggsave("test_ggplot.pdf", g, width=8.5,height=5)
