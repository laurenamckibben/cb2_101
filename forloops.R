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

