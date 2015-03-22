#entering test set
test <- read.table("UCI HAR Dataset/test/X_test.txt") 
head(test)

#entering train set
train <- read.table("UCI HAR Dataset/train/X_train.txt") 
head(train)

#entering labels - (activies)
label <- read.table("UCI HAR Dataset/activity_labels.txt")
label

#entering features(all variables of the study)
features <- read.table("UCI HAR Dataset/features.txt")
features

#entering the subjects (1 to 30)
trainsub <- read.table("UCI HAR Dataset/train/subject_train.txt")
head(trainsub)
testsub <- read.table("UCI HAR Dataset/test/subject_test.txt")
head(testsub)

#entering activities (1 to 6) for each train n test
trainlabel <- read.table("UCI HAR Dataset/train/y_train.txt")
testlabel <- read.table("UCI HAR Dataset/test/y_test.txt")

#changing the col name to Activities(ACT)  and adding the activities col to respective datasets
colnames(testlabel) <- "act"
testact <- cbind(test,testlabel)

colnames(trainlabel) <- "act"
trainact <- cbind(train,trainlabel)

#changing the col name to subject(SUB)  and adding the subject col to respective datasets
colnames(trainsub) <- "sub"
colnames(testsub) <- "sub"
trainactsub <- cbind(trainact,trainsub)
testactsub <- cbind(testact,testsub)

#merging both data sets into 1

mactsub <- merge(testactsub,trainactsub,all=TRUE)
colnames(mactsub) <- features$V2
colnames(mactsub)[562] <- "ACT"
colnames(mactsub)[563] <- "SUB"

##Extracting the dataset of just MEAN and STANDARD DEVIATION
ext <- mactsub[,grep("mean|std|ACT|SUB", colnames(mactsub))]


#arranging the dataset in increasing order of Subject then activites(for readability)
new <- ext[order(ext$SUB,ext$ACT),]

#new empty Data frame
df<-data.frame()


#calculating Mean of each activite for each Subject 
#and adding up in the new dataframe
for(i in 1:30){
  
  for(j in 1:6){
    
    dummy <- new[ (new$ACT== j & new$SUB == i),]
    d <- apply(dummy,2,mean)
    df <- rbind(df,d)
  }
}

#Giving col name the new df
colnames(df)<- colnames(new)
View(df)

#rearranging the Dataset - Subject and activities coloumn to the left
df2 <- df[c(81,80,1:79)]
View(df2)

#writing the final dataframe
write.table(df2, file = "df_tidy.txt",row.name=FALSE)


