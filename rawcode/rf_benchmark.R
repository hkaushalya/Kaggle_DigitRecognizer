# makes the random forest submission
rm(list=ls())
library(randomForest)

train <- read.csv("data/train.csv", header=TRUE)
test <- read.csv("data/test.csv", header=TRUE)

labels <- as.factor(train[,1])
train <- train[,-1]

rf <- randomForest(train, labels, xtest=test, ntree=200)
predictions <- levels(labels)[rf$test$predicted]


ImageId <- c(1:nrow(test))
Label <- predictions
df <- data.frame(cbind(ImageId, Label))
str(df)
head(df)
write.csv(df, file="output/rf_benchmark_n200.csv", row.names=F, quote=F) 

# see here for improving this prediction
#http://www.stat.berkeley.edu/~breiman/RandomForests/cc_home.htm

plot(rf, uniform=TRUE, main='Classification (RF)')
text(model.rpart, all =TRUE, cex = 0.75)

draw.tree(rf, cex=0.5, nodeinfo=TRUE, col=gray(0:8/8))
## Confusion Matrix (RPart)
prediction.rf <- predict(rf, newdata =DATASET.test, type = 'class')
head(DATASET.test)
head(prediction.rf)
str(prediction.rf)

DATASET.test$Y <- prediction.rf
table(`Actual Class` = DATASET.test$Y, `Predicted Class`= prediction.rf)

error.rate.rpart <- sum(DATASET.test$Y != prediction.rf)/nrow(DATASET.test)
print(paste0("Accuracy (Precision): ", 1 - error.rate.rpart))

ImageId <- c(1:nrow(DATASET.test))
Label <- prediction.rpart
df <- data.frame(cbind(ImageId, Label))
str(df)
write.csv(df,file='output/result_rpart_v1.csv', quote=FALSE, row.names=FALSE)
