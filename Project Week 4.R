## Week 4, Peer-graded Assignment: Getting and Cleaning Data Course Project 


fileN <- "UCIdata.zip"
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(fileN)){
  download.file(url,fileN, mode = "wb") 
}


subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")  


#1.
DataSet <- rbind(X_train,X_test)

#2.
Mean_Std <- grep("mean()|std()", features[, 2]) 
DataSet <- DataSet[,Mean_Std]

#4.
FeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
NamesDataSet <- FeatureNames[MeanStdOnly]


Subject <- rbind(subject_train, subject_test)
Names_subject <- 'Subject'
Activity <- rbind(y_train, y_test)
Names_activity <- 'Activity'

DataSet <- cbind(Subject,Activity, DataSet)

#3.
act_group <- factor(DataSet$Activity)
levels(act_group) <- activity_labels[,2]
DataSet$Activity <- act_group

#5.
BaseData <- melt(DataSet,(id.vars=c("Subject","Activity")))
DataSet2 <- dcast(BaseData, subject + activity ~ variable, mean)
DataSet2[-c(1:2)] <- paste("[mean of]" , DataSet2[-c(1:2)] )
Write.table(DataSet2, "tidy_data.txt", sep = ",")



