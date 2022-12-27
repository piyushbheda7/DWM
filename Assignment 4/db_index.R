install.packages("clusterSim")

library(clusterSim)

data(iris)
df <- iris[-5]

pamm <- pam(df , 4)

distance <- dist(df)

print(index.DB(df, pamm$clustering,distance, 
               centrotypes="medoids"))
