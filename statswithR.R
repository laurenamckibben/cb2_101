#Regression Analysis

#Linear Model: this code uses a formula syntax (i.e this~that)
m<-lm(y~x)
summary(m)
#when reading the summary, if the adjusted R-squared is higher then the fit is better. Pvalue gives significance
#save summary to something
s<-summary(m)
#you can call specific values from the saved summary statements
s$r.squared

#excercise, get an R squared for every variable vs every variables

#plot line through the linear model data
abline(m)


###Class Excercise####
for (i in 1:ncol(iris)) {
  y<-as.numeric(iris[[i]])
  for (j in 1:ncol(iris)){
    x<-as.numeric(iris[[j]])
    m<-lm(y~x)
    s<-summary(m)
    print(paste(names(iris)[i], names(iris)[j], s$r.squared))
  }
}


#Correlation Analyses
#cor.test automatically uses pearson but you can select kendal and spearman type too
corout<-cor.test(iris[,1], iris[,2])
corout
