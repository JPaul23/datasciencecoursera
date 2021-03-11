library(datasets)
data(iris)
spec <- split(iris, iris$Species)
#head(spec)

result <-sapply(spec, function(x){
    colMeans(x[, c("Sepal.Length","Sepal.Width","Petal.Length" ,"Petal.Width")])
})

# Look for mean in Sepal.Length for virginica
print("*===================================*")
print(result)
print("*===================================*")
#question_2
print(apply(iris[, 1:4], 2,mean))
print("*===================================================*")


print(apply(iris[, 1:4], 1,mean))
print("*===================================================*")

print(rowMeans(iris[,1:4]))

#question_3
library(datasets)
data("mtcars")
?mtcars

a <- with(mtcars, tapply(mpg, cyl, mean))
b <- tapply(mtcars$mpg,mtcars$cyl, mean)
c<- sapply(split(mtcars$mpg, mtcars$cyl), mean)

#question_4

library('dplyr')
#filtering
data_cyl <- filter(mtcars, cyl == 4)
data_cyl8 <- filter(mtcars, cyl == 8)

hp4 <- sapply(split(data_cyl$hp,data_cyl$cyl), mean)
hp8 <- sapply(split(data_cyl8$hp, data_cyl8$cyl), mean)

print(abs(hp4 - hp8))
