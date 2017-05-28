CodeBook for run_Analysis.R file

The first group of code downloads the projects dataset from the zipfle at the following location "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Below is a list of datasets downloaded from the zipfile abve

1. xtrain - This represents the training dataset that contains the different movement metrics for each type of activity by subject
2. ytrain - This contains the activity data that will later get merged with the xtrain data
3. subjectTrain - This contains the data by subject which will later get merged with the xtrain data
4. xtest -This represents the test dataset that contains the different movement metrics for each type of activity by subject
5. ytest - This contains the activity data that will later get merged with the xtest data
6. subjectTest - This contains the data by subject which will later get merged with the xtest data
7. features - contains the variable names for the xtest and ytest datasets
8. ActivityLabels-the names for the activities in the ytrain and xtrain files

Below is a list of the data transformations peformed on the dataset above

trainCombine - combined the xtrain data with the ytrain activities dataset and subjectTrain dataset
testCombine - combined the xtest data with the ytest activities dataset and subjectTest dataset
Combine - rcombines trainCombine and testCombine to create one dataset

ColNamesToGrep-list of all the column names in the Combine Dataset.
ColsToKeep - logical vector that selects only the standard deviation and mean categories
meanStdDF<-Combine dataframe that has the ColsTokeep logical vector applied to it to select columns
finalFrame - groups the activity and subject variables and summarises the remaining variables by the mean function


