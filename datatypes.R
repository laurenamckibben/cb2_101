#An overview of R data types. 

#import built in data
data(iris)
#this is called a data frame

#find the dimensions of iris
dim(iris)
#removed the first column line number
cat(dim(iris))
#show the struncture of the data
str(iris)

#show spreadsheet of iris data
View(iris)

#iris data includes numeric measurements of sepal and petal of irises along with species class
#data frames are the most fundamental data type in R
#determine what type of data 
class(iris)
#iris is a data frame

#can subset a data frame the same way as vector
#grab the 2nd row and 3rd column value from iris
iris[1,1]
#grab the whole first row
iris [1,]
#grab the whole first column
iris[,1]
#if the data already has a header , then you can call information by the header
#when this data is extracted, it is extracted as a vector
iris$Sepal.Length

#factor is a special type of data vector
#it appears to be a set of characters, but actually there is a number assigned to each character

#to remove a column and save the data as a new dataset
iris_subset<-iris[,-5]
