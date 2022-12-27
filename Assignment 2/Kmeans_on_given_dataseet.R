
o1 = c(2,6)
o2 = c(3,4)
o3 = c(3,8)
o4 = c(4,7)
o5 = c(6,2)
o6 = c(6,4)
o7 = c(7,3)
o8 = c(7,4)
o9 = c(8,5)
o10 = c(7,6)

x = rbind(o1,o2,o3,o4,o5,o6,o7,o8,o9,o10)
c = rbind(o1,o2)

flag = TRUE
first = array( 0 ,dim = c(nrow(c),2))
last = array( 0 ,dim = c(nrow(c),2))

while(flag){
  distance = c()
  Cluster = array( 0 ,dim = c(nrow(c),3))
  
  for(i in 1:nrow(c)){
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
        minDist = dist1;
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
    index = distance[j,][2]
    Cluster[index][1] = Cluster [index][1] + x[j-1,][1]
    Cluster [index,][2] = Cluster [index,][2] + x[j-1,][2]
    Cluster [index,][3] = Cluster [index,][3] + c(1)
  }
  
  for (j in 1:nrow(first)) {
    last[j,][1] = Cluster [j,][1]/ Cluster [j,][3]
    last[j,][2] = Cluster [j,][2]/ Cluster [j,][3]
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
