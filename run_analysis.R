#download files to client

if(file.exists("./data")){dir.create("./data")}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./data/Dataset.zip")
unzip(zipfile = "./data/Dataset.zip",exdir="./data")

#read file to R

xtrain<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjectTrain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

xtest<-read.table("./data/UCI HAR Dataset/test/x_test.txt")
ytest<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjectTest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features<-read.table("./data/UCI HAR Dataset/features.txt")

activityLabels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")


#change columns names and create one dataset

names(xtrain)<-features$V2
names(xtest)<-features$V2
names(ytrain)<-"ActivityID"
names(ytest)<-"ActivityID"
names(subjectTrain)<-"SubjectID"
names(subjectTest)<-"SubjectID"
names(activityLabels)<-c("ActivityID","ActivityName")

trainCombine<-cbind(ytrain,subjectTrain,xtrain)
testCombine<-cbind(ytest,subjectTest,xtest)

Combined<-rbind(trainCombine,testCombine)


#create dataset of only mean standard deviation activity and subject columns
ColNamesToGrep<-names(Combined)



colstoKeep<-grepl("ActivityId|SubjectID|mean|std",x = ColNamesToGrep,ignore.case = T)

MeanStdDF<-Combined[,colstoKeep]

AddNames<-merge(MeanStdDF,activityLabels,by.x = "ActivityID",by.y = "ActivityID")

#create tidy dataset that calculates mean of each variable by subject and activity

finalFrame<-AddNames %>% group_by(ActivityName,SubjectID) %>%summarise_each(funs(mean))








