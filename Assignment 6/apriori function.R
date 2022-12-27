# clear work-space
rm(list = ls())
library(arules)

# importing dataset
data("Groceries")

# using apriori() function 
Answer <- apriori(Groceries, parameter=list(supp = 0.01,conf=0.2))

# using inspect() function
inspect(Answer[1:10])
