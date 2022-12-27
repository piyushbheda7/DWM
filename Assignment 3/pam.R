install.packages("ClusterR")
install.packages("cluster")

data(iris)
str(iris)

library(ClusterR)
library(cluster)

set.seed(8953)o
iris2 <- iris

iris2$Species <- NULL

pam.result <- pam(iris2, 3)

table(pam.result$clustering, iris$Species)
plot(pam.result)
