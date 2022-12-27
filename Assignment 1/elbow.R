library(factoextra) 
library(NbClust) 
library(parameters) 

X <- read.csv(file = "D:\\Study\\sem7\\DWM\\new\\Assignment 1\\X.csv") 
distance <- dist(X, method = "euclidean") 
distance 

model <- kmeans(X, centers = 2) 
model$cluster 
X_cluster <- data.frame(X,cluster = as.factor(model$cluster)) 
head(X_cluster) 

(BSS <- model$betweenss) 
(TSS <- model$totss) 
BSS / TSS * 100 
model2 <- kmeans(X, centers = 2, nstart = 10) 
100 * model2$betweenss / model2$totss 


model3 <- kmeans(X, centers = 3) 
BSS3 <- model3$betweenss 
TSS3 <- model3$totss 
BSS3 / TSS3 * 100 

fviz_nbclust(X, kmeans, method = "wss",diss=NULL,k.max = 9)+labs(subtitle = "Elbow method") 

