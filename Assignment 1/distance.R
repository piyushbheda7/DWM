install.packages("lsa")
library(lsa)

#euclidean_d <- funtion(x,y)
#  sqrt(sum((x-y)^2))

#manhattan_d <- funtion(x,y){
#  dist<- abs(x-y)
#  dist <- sum(dist)
#  dist
#}

#chebyshev_b <- funtion(x,y){
#  max(abs(x-y))
#}

#x <- read.csv(file = "D:\\Study\\sem7\\DWM\new\\Assignment 1\\X.csv")

#euclidean_d(x,y)
#manhattan_d(x,y)
#cosine(x,y)
#chebyshev_b(x,y)

x <- read.csv(file = "D:\\Study\\sem7\\DWM\\new\\Assignment 1\\X.csv")

euclidean_d <- dist(x,method="euclidean")
manhattan_d <- dist(x,method = "manhattan")
