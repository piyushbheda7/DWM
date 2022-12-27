library(factoextra)
library(NbClust)
library(parameters)

O1 <-c(2,6)
O2 <-c(3,4)
O3 <-c(3,8)
O4 <-c(4,7)
O5 <-c(6,2)
O6 <-c(6,4)
O7 <-c(7,3)
O8 <-c(7,4)
O9 <-c(8,5)
O10 <-c(7,6)

x <- rbind(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10)

colnames(x) <- c("A1","A2")

df<- data.frame(x)
write.csv(df,"D:\\Study\\sem7\\DWM\\new\\Assignment 1\\X.csv",row.names = FALSE)