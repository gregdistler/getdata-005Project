setwd("/Users/gregdistler/getdata-005Project")

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
names(allY) <- "Activity_ID"
names(actlabels) <- c("ID","Activity")

##now find features with just mean() and std()
meanInds <- grep("mean()",features[,2])
stdInds <- grep("std()",features[,2])
bothInds <- sort(union(meanInds,stdInds))

##take only X std() and mean() values
allX_2 <- allX[,bothInds]

##column bind
AllData_NoAct <- cbind(allX_2,allSubj)
AllData_NoAct <- cbind(AllData_NoAct,allY)

##now merge data
AllData_Act <- merge(AllData_NoAct,actlabels,by.x = "Activity_ID",by.y = "ID",all=TRUE)


##now take the mean by subject and activity for the final set
Final_Means <- aggregate(AllData_Act[2:80],list(AllData_Act$Subject,AllData_Act$Activity),FUN = mean,na.rm=TRUE)
names(Final_Means)[1] <- "Subject"
names(Final_Means)[2] <- "Activity"

write.table(Final_Means,"Final_Tidy_Means.txt")