## Download and unzip the zip file data from the website ##
setwd()
if(!file.exists("./getdata"))
        dir.create("./getdata")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "~/Documents/Coursera/Getting and Cleaning Data/assignment/getdata.zip", method = "curl")
listzip <- unzip("~/Documents/Coursera/Getting and Cleaning Data/assignment/getdata.zip", exdir = "~/Documents/Coursera/Getting and Cleaning Data/assignment")

## Step1. Merges the training and the test sets to create one data set ##
## Load the data into R ##
test_x <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/test/X_test.txt")
dim(test_x)
head(test_x, n=3)
test_y <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/test/y_test.txt")
dim(test_y)
head(test_y, n=3)
test_subject <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/test/subject_test.txt")
dim(test_subject)
head(test_subject, n=3)
train_x <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/train/X_train.txt")
dim(train_x)
head(train_x, n=3)
train_y <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/train/y_train.txt")
dim(train_y)
head(train_y, n=3)
train_subject <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/train/subject_train.txt")
dim(train_subject)
head(train_subject, n=3)
## Merge the train and the test data to create a new dataset ##
Data_x <- rbind(test_x, train_x)
dim(Data_x)
Data_activity <- rbind(test_y, train_y)
dim(Data_activity)
Data_subject <- rbind(test_subject, train_subject)
dim(Data_subject)

## Step2. Extracts only the measurements on the mean and standard deviation for each measurement ##
## Load the feature names into R ## 
features <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/features.txt")
dim(features)
## Extract the mean and standard deviation(std) of each measurements(each row) ##
meanstd <- grep(("mean\\(\\)|std\\(\\)"), features[, 2])
featureNames <- features[meanstd, 2]
Data_x <- Data_x[, meanstd]
names(Data_x) <- featureNames
dim(Data_x)

## Step3. Uses descriptive activity names to name the activities in the data set ##
## Load the activity labels into R ##
activity_labels <- read.table("~/Documents/Coursera/Getting and Cleaning Data/assignment/UCI HAR Dataset/activity_labels.txt")
dim(activity_labels)
## Replace the activities in the data set with descriptive activity names ##
Data_activity[,1] <- activity_labels[Data_activity[,1], 2]
names(Data_activity) <- "activity"
head(Data_activity)

## Step4. Appropriately labels the data set with descriptive variable names ##
## merged all the 3 data sets together to create a single data set and correct the column name ##
names(Data_subject) <- "subject"
mergedData <- cbind(Data_x, Data_activity, Data_subject)
dim(mergedData)
## Change column names using the appropriate variable labels ##
names(mergedData) <- gsub("\\(\\)", "", names(mergedData)) ## remove "()" in variable names ##
names(mergedData) <- gsub("-mean", "Mean", names(mergedData)) ## remove "-" and capitalize the "m" in variable names ##
names(mergedData) <- gsub("-std", "Std", names(mergedData)) ## remove "-" and capitalize the "s" in variable names ## 
names(mergedData) <- gsub("^t", "Time", names(mergedData)) ## makes the variable name more descriptive ##
names(mergedData) <- gsub("^f", "Freq", names(mergedData)) ## makes the variable name more descriptive ##
names(mergedData) <- gsub("activity", "Activity", names(mergedData)) ## capitalize the first letter in variable name "activity" ##
names(mergedData) <- gsub("subject", "Subject", names(mergedData)) ## capitalize the first letter in variable name "subject" ##
head(mergedData)

## Step5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject ##
library(dplyr)
groupedData <- group_by(mergedData, Subject, Activity)
average_Data <- summarise_each(groupedData, funs(mean))
head(average_Data)
write.table(average_Data, "~/Documents/Coursera/Getting and Cleaning Data/assignment/meanData.txt", row.names = FALSE)








