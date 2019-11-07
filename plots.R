data(iris)

#How to make Plots in R

#make a basic correlation plot of every variable by every other variable
plot(iris)



#make data for plotting
x<-rnorm(100)
y<-rnorm(100)

#make a histogram of x
hist(x)

#make data with specific characterisitics
y<-rnorm(100, mean=5, sd=1)

#plot histogram with 50 bars
hist(y, breaks=50)
#plot density plot instead of histogram. It looks like a smooth outline of the top of a histogram
plot(density(y))

#plot x by y and add more features to the plot
#pch is shape of points
#to search options for any feature you can run the code ?pch or ?col, etc
plot(x,y, main="some random data", xlab="some x", ylab="some y", pch=22, col="red")


#boxplots, R plots median in boxplots
boxplot(iris)


#MADS; Median absolute deviation, median of medians
#caluculate median and subtract median from every point
#take square and take the median of that value

#how to transform data into linear form
#most commonly a log transformation

#barplot
barplot(iris[,1], iris[,2])

barplot(c(2,4,5))

#create a data frame
df<-data.frame(x=c(2,3,4), y=c(10,30,40))
df

#plot a stacked grouped barplot
barplot(as.matrix(df))

#unstacked
barplot(as.matrix(df), beside=T)

#flip the data to group the bars by their experimental group
t(df)
barplot(as.matrix(t(df)), beside=T)

##Calculate SEM so that you can use it for error bars


#create a data frame to store our results. 
result<-data.frame()
#calculate the mean 
result_list<-lapply(split_data, function(x){
  tmp_df<-data.frame(mean=mean(x$Petal.Width), sd=sd(x$Petal.Width))
  return(tmp_df)
  #result<<-rbind(result, tmp_df)
  #return(mean(x$Petal.Width))
})


result_list
result<-do.call(rbind, result_list)
result

#add error bars
b<-barplot(result[,1], ylim=c(0,max(result[,1]+result[,2])))
#if you store the barplot, the vector contains the middle points of all the boxes from the plot
b
mids<-b[,1]
arrows(x0=mids, y0=result[,1]-result[,2], x1=mids, y1=result[,1]+result[,2], code=3, angle=90)


#colors with r color brewer
install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all()


nice_color<-brewer.pal(3, "Accent")
barplot(t(as.matrix(df)), beside=T, col=nice_color[1:2])


#mathematical functions cannot be done on NA
x<-c(1,2,3,4,NA)
mean(x)
sum(x)


#How to remove NA
#show where a number in the data is greater than 2
x>2
#keep the subset of the data where x is not greater than 2
x[!x>2]
#show where a value in your data is NA
is.na(x)
#show where a value is not NA
!is.na(x)
#take the data subset where the values are not NA
x[!is.na(x)]

y<-c(5,6,7,8,10)
df<-data.frame(x=x, y=y)
df[is.na(df)]<-0

df[!is.na(apply(df,MARGIN=1, sum)),]

