# makes the KNN submission
rm(list=ls())
library(FNN)

train <- read.csv("data/train.csv", header=TRUE)
test <- read.csv("data/test.csv", header=TRUE)
head(test)
str(train)

#removing the label column from
labels <- train[,1]
train <- train[,-1] # do not do this if splitting the train sample

#split train data for testing
frac <- 0.9
nr <- nrow(train)
n1 <- floor(nr * frac)
train.p1 <- train[1:n1,]
train.p2 <- train[(n1+1):nr,]
labels.p1 <- train.p1[,1]
labels.p2 <- train.p2[,1]

#now remove the 'label' column from the train.p2
train.p1 <- train.p1[,-1]
train.p2 <- train.p2[,-1]

#results <- (0:9)[knn(train, test, labels, k = 10, algorithm="cover_tree")]
results <- (0:9)[knn(train.p1, train.p2, labels.p1, k = 10, algorithm="cover_tree", na.omit)]
results <- (0:9)[knn(train.p1, train.p2, labels.p1, k = 10, algorithm="kd_tree", na.omit)]

str(results)
output <- data.frame(cbind(train))

#write(results, file="knn_benchmark.csv", ncolumns=1) 
write(results, file="data/knn_benchmark.csv", ncolumns=1) 
