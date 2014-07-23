setwd("/Users/gregdistler/getdata-005Project")

if(!file.exists("./data")){dir.create("./data")}

## read in the test data
subtest <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("data/UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("data/UCI HAR Dataset/test/Y_test.txt")

## read in the training data
subtrain <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("data/UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("data/UCI HAR Dataset/train/Y_train.txt")

## read in the label data
actlabels <- read.table("data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("data/UCI HAR Dataset/features.txt")

allX <- rbind(xtest,xtrain)
allSubj <-rbind(subtest,subtrain)
allY <- rbind(ytest,train)

names(xtest)<-features[,2]
names(xtrain)<-features[,2]
rbind - row bind

cbind - column bind