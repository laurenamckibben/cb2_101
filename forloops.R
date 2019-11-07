#For Loops

#Basic strucutres
for() {
}

#count the number of columns in a data frame
ncol(iris)

#Use a for loop to calculate the mean of each of the first 4 column variables

for(i in 1:4) {
 print(paste(names(iris)[i],mean(iris[,i])))
}

print(paste("a","b"))


#use lapply to return list, vapply for vectors, apply is for multidimensional data
#apply takes the data and a funtion call and an option called margin (1 for rows, 2 for columns)to determine the order of operation

subset_iris<-iris[,c(1:4)]
apply(subset_iris, MARGIN = 2, sum)

##Using L Apply
mean_pw<-lapply(split_data, function(x){
  return(mean(x$Petal.Width))
})
