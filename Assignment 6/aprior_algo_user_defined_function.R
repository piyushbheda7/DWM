data<-read.csv(file="D:\\Study\\sem7\\DWM\\DWM\\Assignment 6\\data1.csv")

print(data)



uniqele=c()
index=0
for(i in 1:nrow(data)){
  for(j in 1:ncol(data)){
    uniqele[index]=data[i,j]
    index=index+1
  }
}
print(uniqele)
uniqele=uniqele[!duplicated(uniqele)]
u=c()
ind=1
for(i in 1:length(uniqele)){
  if(uniqele[i]!=""){
    u[ind]=uniqele[i]
    ind=ind+1
  }
}
print(u)

freqmat=matrix(0L,nrow =length(u),ncol = 2)

for(i in 1:length(u)){
  freqmat[i,1]=u[i]
}

for(i in 1:nrow(data)){
  for(j in 1:ncol(data)){
    for(k in 1:length(u)){
      if(data[i,j]==freqmat[k,1]){
        freqmat[k,2]=as.numeric(freqmat[k,2])+1
      }
    }
  }
}

print(freqmat)

support=33

supportcount=(support*nrow(data))/100
supportcount=ceiling(supportcount)
print(supportcount)

count=0

for(i in 1:nrow(freqmat)){
  if(as.numeric(freqmat[i,2])>=supportcount){
    count=count+1
  }
}

freqmat2=matrix(0L,nrow = count,ncol = 2)
index1=1
for(i in 1:nrow(freqmat)){
  if(as.numeric(freqmat[i,2])>=supportcount){
    freqmat2[index1,1]=freqmat[i,1]
    freqmat2[index1,2]=freqmat[i,2]
    index1=index1+1
  }
}

print(freqmat2)

freqmat3=matrix(0L,nrow =nrow(freqmat2),ncol=3 )

for(i in 1:(nrow(freqmat3)-1)){
  freqmat3[i,1]=freqmat2[i,1]
  freqmat3[i,2]=freqmat2[i+1,1]
}
freqmat3[4,2]=freqmat2[1,1]
freqmat3[4,1]=freqmat2[4,1]


for(index2 in 1:nrow(freqmat3)){
  count=0
  
  for(i in 1:nrow(data)){
    first=FALSE
    second=FALSE
    for(j in 1:ncol(data)){
      if(freqmat3[index2,1]==data[i,j]){
        first=TRUE
      }
      else if(freqmat3[index2,2]==data[i,j]){
        second=TRUE
      }
      if(first==TRUE && second==TRUE){
        count=count+1
        break
      }
    }
  }
  freqmat3[index2,3]=count
}

print(freqmat3)

count=0

for(i in 1:nrow(freqmat3)){
  if(as.numeric(freqmat3[i,3])>=supportcount){
    count=count+1
  }
}

freqmat4=matrix(0L,nrow = count,ncol=3)
index3=1
for(i in 1:nrow(freqmat3)){
  if(as.numeric(freqmat3[i,3])>=supportcount){
    freqmat4[index3,1]=freqmat3[i,1]
    freqmat4[index3,2]=freqmat3[i,2]
    freqmat4[index3,3]=freqmat3[i,3]
    index3=index3+1
  }
}
print(freqmat4)

freqmat5=matrix(0L,nrow=1,ncol=4)
for(i in 1:1){
  for(j in 1:(ncol(freqmat4)-1)){
    freqmat5[1,j]=freqmat4[i,j]
  }
}
freqmat5[1,3]=freqmat4[2,2]

for(i in 1:nrow(data)){
  first1=FALSE
  second1=FALSE
  third1=FALSE
  for(j in 1:ncol(data)){
    if(freqmat5[1,1]==data[i,j]){
      first1=TRUE
    }
    else if(freqmat5[1,2]==data[i,j]){
      second1=TRUE
    }
    else if(freqmat5[1,3]==data[i,j]){
      third1=TRUE
    }
    if(first1==TRUE && second1==TRUE && third1==TRUE){
      freqmat5[1,4]=as.numeric(freqmat5[1,4])+1
      break
    }
  }
}
print(freqmat5)


confidence=0.5
for(i in 1:3){
  occur1=0
  occur2=0
  item1=""
  item2=""
  item3=""
  for(j in 1:nrow(freqmat)){
    if(freqmat5[1,i]==freqmat[j,1]){
      occur1=freqmat[j,2]
      item1=freqmat5[1,i]
      break
    }
  }
  logic=0
  for(k in 1:3){
    if(k!=i){
      if(logic==0){
        item2=freqmat5[1,k]
        logic=1
      }
      else if(logic==1){
        item3=freqmat5[1,k]
      }
    }
  }
  percentage=(as.numeric(freqmat5[1,4]))/as.numeric(occur1)
  if(percentage>confidence){
    print(paste(item1,'->',item2,item3))
    
  }
}

for(i in 1:2){
  item1=freqmat5[1,i]
  item2=freqmat5[1,i+1]
  item3=""
  occur2=0
  for(j in 1:nrow(freqmat3)){
    if((item1==freqmat3[j,1] && item2==freqmat3[j,2]) || (item1==freqmat3[j,2] && item2==freqmat3[j,1])){
      occur2=freqmat3[j,3]
    }
  }
  for(k in 1:3){
    if(k!=i && k!=i+1){
      item3=freqmat5[1,k]
    }
  }
  percentage=(as.numeric(freqmat5[1,4]))/as.numeric(occur1)
  if(percentage>confidence){
    print(paste(item1,item2,'->',item3))
  }
}

item1=freqmat5[1,3]
item2=freqmat5[1,1]
item3=freqmat5[1,2]
occur2=0
for(j in 1:nrow(freqmat3)){
  if((item1==freqmat3[j,1] && item2==freqmat3[j,2]) || (item1==freqmat3[j,2] && item2==freqmat3[j,1])){
    occur2=freqmat3[j,3]
  }
}
percentage=(as.numeric(freqmat5[1,4]))/as.numeric(occur1)
if(percentage>confidence){
  print(paste(item1,item2,'->',item3))
}
