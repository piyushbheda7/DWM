install.packages("clValid")

library(clValid)

data(iris)
df <- iris[-5]

distance <- dist(df , method = "euclidean")
clusterObj <- hclust(distance , method = "average")

nc <- 2

cluster <- cutree(clusterObj,nc)

dunn(distance,cluster)
