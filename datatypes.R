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

#Working with Data Headers

#gives the header names
names(iris)
#change the header names
names(iris_subset)<-c("slength", "swidth", "plength", "pwidth")


#get a basic summary of the overall data
summary(iris)

#extract the species column
iris$Species
#what type of vector is column 5
class(iris[,5])
#What are the group options or levels for this factor variable
levels(iris$Species)

#You can convert a data type to another data type
all_species<-as.character(iris$Species)
class(all_species)

#Split the data based on the factor variables
#split command only works on factor type variables and output a list of dataframes according to each of the factors of the splitting variable
split_data<-split(iris,iris$Species)

#call the first dataframe element of the split list
split_data[[1]]

#assign this first list to a new variable
first_element<-split_data[[1]]

#can also do this by using the name of element 
first_element<-split_data[["setosa"]]

#grab the 2nd and 3rd row from the setosa element of the split_data list
set_pl<-split_data[["setosa"]][,c(2,3)]




