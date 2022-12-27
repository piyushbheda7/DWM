library(fpc)
iris_dataset <- iris[-5]

set.seed(220)
Dbscan_d1 <- dbscan(iris_dataset, eps = 0.45, MinPts = 5)
Dbscan_d1

Dbscan_d1$cluster

table(Dbscan_d1$cluster, iris$Species)

plot(Dbscan_d1, iris_dataset, main="DBScan")