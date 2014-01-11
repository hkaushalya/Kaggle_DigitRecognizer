
x<-c(1:10)
y<-c(11:20)
z<-c(21:30)
df <- data.frame(cbind(x,y,z))
df
df[,-1]

data(iris3)

train <- read.csv("data/train.csv", header=TRUE)

f1 <- train[2,]
f1 <- f1[,-1]
m <- matrix(rev(f1),nrow=28)
image(1:28, 1:28, m)
str(m)

im <- matrix(data=rev(im.train[r,]), nrow=96, ncol=96)
image(1:96, 1:96, im, col=gray((0:255)/255))