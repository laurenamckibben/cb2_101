#How to Write Functions

#data to use
#data(iris)

#give a function a name, basic structure
myfirst_function<- function() {
  
}
#function to add two numbers. 
myfirst_function<- function(a,b) {
  return(a+b)
}

#use the function to calculate something
result<-myfirst_function(2,3)

#what if no input is given? Write a default input into the function script
#function to add two numbers. 
myfirst_function<- function(a,b=10) {
  return(a+b)
}

result<-myfirst_function(2,)
cat(result)
