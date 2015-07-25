#Getting and Cleaning Data Course Project

library(dplyr)

#Step 1 - Merge the training and the test sets to create one data set

#Read data files

train<-read.table("train/X_train.txt")
train_label<-read.table("train/Y_train.txt")
train_subject<-read.table("train/subject_train.txt")

test<-read.table("test/X_test.txt")
test_label<-read.table("test/Y_test.txt")
test_subject<-read.table("test/subject_test.txt")

#Merge files

data<-rbind(train,test)
label<-rbind(train_label,test_label)
subject<-rbind(train_subject,test_subject)

#Name columns

names(subject)<-c("Subject")
names(label)<-c("Activity")

featurenames<-read.table("features.txt")
names(data)<-featurenames$V2

#Step 2 - Extract only the measurements on the mean and standard deviation for each measurement

#Identify colums to select (column name contains mean or std)
featurenames_selected<-featurenames$V2[grep("mean\\(\\)|std\\(\\)", featurenames$V2)]
datacolumns_selected<-c(as.character(featurenames_selected))
data_filtered<-subset(data,select=datacolumns_selected)

#Back to Step 1 - Combining tables
alldata<-cbind(data_filtered,subject,label)

#Step 3 - Use descriptive activity names to name the activities in the data set

activities<-read.table("activity_labels.txt")

#Update activity names based on activity table

alldata[,68]<-activities[alldata[,68],2]

#Step 4 - Appropriately label the data set with descriptive variable names

#Rename columns
names(alldata)<-gsub("^t", "time", names(alldata))
names(alldata)<-gsub("^f", "frequency", names(alldata))
names(alldata)<-gsub("Acc", "Accelerometer", names(alldata))
names(alldata)<-gsub("Gyro", "Gyroscope", names(alldata))
names(alldata)<-gsub("Mag", "Magnitude", names(alldata))
names(alldata)<-gsub("BodyBody", "Body", names(alldata))
names(alldata)<-gsub("mean", "Mean", names(alldata))
names(alldata)<-gsub("std", "Stdev", names(alldata))

#Step 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

#Group data by subject and activity
alldata_grouped<-group_by(alldata, Subject, Activity)

#Calculate mean for each variable except subject and activity used in grouping
alldata_summarized<-summarise_each(alldata_grouped,funs(mean))

#Write to file
write.table(alldata_summarized, file = "final.txt",row.name=FALSE)
