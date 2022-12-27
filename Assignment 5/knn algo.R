
CalculateEuclideanDistance <- function(vect1, vect2) sqrt(sum((vect1 - vect2)^2))

matrix <- read.csv(file = "D:\\Study\\sem7\\DWM\\DWM\\Assignment 5\\heart.csv")

dist <- c()
test_dataset <- c(54 , 1 , 2 , 112 , 210 , 0 , 1 , 167 , 1 , 1.3 , 2 , 1 , 1)

#test_dataset <- c(63 , 0 , 0 , 150 , 407 , 0 , 0,	154,	0,	4,	1,	3,	3)


for(j in 2:nrow(matrix)){ # this is for the 5 row data
  
  data <- as.integer(matrix[j,][1:13])
  dataset <- as.integer(test_dataset[1:13])
  
  distance <- CalculateEuclideanDistance(data, dataset)
  
  dist <- append(dist , distance)
  
}

#print(dist)
temp_dist <- sort(dist)
#print(temp_dist)

for(i in 1:200){ # this is for k iteration
  
  print(paste0("k = ", i))
  
  YesRes <- 0
  NoRes <- 0
  
  for(j in 1:5){
    if(temp_dist[i] >= dist[j]){
      if(matrix[j,][14] == 1){
        YesRes <- YesRes + 1
      }
      else{
        NoRes <- NoRes + 1
      }
    }
  }
  
  #print(YesRes)
  #print(NoRes)
  
  if(YesRes > NoRes){
    print("Response is : Yes")
  }
  else if(NoRes > YesRes){
    print("Response is : No")
  }
  else {
    print("Can not determined")
  }
}



customer <- c('John' , 'Rachel' , 'Ruth' , 'Tom' , 'Neil')
age <- c(35 , 22 , 63 , 59 , 25)
income <- c(35 , 50 , 200 , 170 , 40)
nocards <- c(3 , 2 , 1 , 1 , 4)
response <- c('Yes' , 'No' , 'No' , 'No' , 'Yes')

test_dataset <- c('David' , 37 , 50 , 2)

matrix <- cbind(customer , age , income , nocards , response)

print(matrix)

dist <- c()

CalculateEuclideanDistance <- function(vect1, vect2) sqrt(sum((vect1 - vect2)^2))

for(j in 1:5){ # this is for the 5 row data
  
  data <- as.integer(matrix[j,][2:4])
  dataset <- as.integer(test_dataset[2:4])
  
  distance <- CalculateEuclideanDistance(data, dataset)
  
  #distance <- sqrt((data[1] - dataset[1])^2 + (data[2] - dataset[2])^2 + (data[3] - dataset[3])^2)
  
  dist <- append(dist , distance)
  
}

#print(dist)
temp_dist <- sort(dist)

for(i in 1:5){ # this is for k iteration
  
  print(paste0("k = ", i))
  
  YesRes <- 0
  NoRes <- 0
  
  for(j in 1:5){
    if(temp_dist[i] >= dist[j]){
      if(matrix[j,][5] == 'Yes'){
        YesRes <- YesRes + 1
      }
      else{
        NoRes <- NoRes + 1
      }
    }
  }
  
  #print(YesRes)
  #print(NoRes)
  
  if(YesRes > NoRes){
    print("Response is : Yes")
  }
  else if(NoRes > YesRes){
    print("Response is : No")
  }
  else {
    print("Can not determined")
  }
}