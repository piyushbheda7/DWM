x = iris[1:4]
c = x[1:3,1:4]

flag = TRUE
# index = c()
first = array( 0 ,dim = c(nrow(c),4))
last = array( 0 ,dim = c(nrow(c),4))

while(flag){
  distance = c()
  Cluster = array( 0 ,dim = c(nrow(c),5))
  
  for(i in 1:2){
    distance[i] = 0
  }
  
  for(i in 1:nrow(x)){
    minDist = 0
    index = 0
    for(j in 1:nrow(c)){
      dist1 = 0
      for(k in 1:nrow(c)){
        dist1 = dist1 + abs(x[i,][k] - c[j,][k])
      }
      if(j==1){
        minDist = dist1
        index = 1
      }else{
        if (minDist > dist1){
          minDist = dist1
          index = j
        }
      }
    }
    distance = rbind(distance , c(minDist , index))
  }
  for(j in 2:nrow(distance)){
    index = distance[j,][[2]]
    print(index)
    Cluster [index,1] = Cluster [index,1] + x[j-1,1]
    Cluster [index,2] = Cluster [index,2] + x[j-1,2]
    Cluster [index,3] = Cluster [index,3] + x[j-1,3]
    Cluster [index,4] = Cluster [index,4] + x[j-1,4]
    # Cluster [index][1] = Cluster [index][1] + x[j-1,][1]
    # Cluster [index][2] = Cluster [index][2] + x[j-1,][2]
    # Cluster [index][3] = Cluster [index][3] + x[j-1,][3]
    # Cluster [index][4] = Cluster [index][4] + x[j-1,][4]
    Cluster [index,][5] = Cluster [index,][5] + c(1)
    print(Cluster)
  }
  
  for (j in 1:nrow(first)) {
    last[j,][1] = Cluster [j,][1]/ Cluster [j,][5]
    last[j,][2] = Cluster [j,][2]/ Cluster [j,][5]
    last[j,][3] = Cluster [j,][3]/ Cluster [j,][5]
    last[j,][4] = Cluster [j,][4]/ Cluster [j,][5]
  }
  
  cond = (last==first)
  
  if(!(FALSE %in% cond)){
    # first centroid and last centroids matching
    # make flag variable value false
    flag = FALSE
  }
  #print(distance)
  c = last
  first = last
}
