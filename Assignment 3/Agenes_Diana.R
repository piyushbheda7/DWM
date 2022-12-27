library(datasets) 
library(cluster)  
library(factoextra) 
library(purrr) 

df <- iris[, 1:4]

df <- na.omit(df)

df <- scale(df)

d <- dist(df, method = "euclidean")
hc1 <- hclust(d, method = "complete" )

plot(hc1, cex = 0.6, hang = -1)

sub_grps <- cutree(hc1, k = 3)
fviz_cluster(list(data = df, cluster = sub_grps))

plot(hc1, cex = 0.6, hang = -1)
rect.hclust(hc1, k = 3, border = 2:4)

hc2 <- agnes(df, method = "complete")

pltree(hc2, cex = 0.6, hang = -1,
       main = "Dendrogram of agnes")

hc3 <- diana(df)
hc3$dc
pltree(hc3, cex = 0.6, hang = -1,
       main = "Dendrogram of diana")
