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

##row bind the data
allX <- rbind(xtest,xtrain)
allSubj <-rbind(subtest,subtrain)
allY <- rbind(ytest,ytrain)

##give descriptive labels to everything
names(allX)<-features[,2]
names(allSubj)<-"Subject"
names(allY) <- "Activity"
names(actlabels) <- c("ID","Act Label")

##column bind
AllData_NoAct <- cbind(allX,allSubj)
AllData_NoAct <- cbind(AllData_NoAct,allY)

##now merge data
AllData_Act <- merge(AllData_NoAct,actlabels,by.x = "Activity",by.y = "ID",all=TRUE)



