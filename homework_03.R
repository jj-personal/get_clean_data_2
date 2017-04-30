
## R code for
## Getting and Cleaning Data
###########################################

## Read and merge x train and test data
x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x.merge <- rbind(x.train, x.test)

## Extract features with "mean" & "std"
feature.name <- read.table("./UCI HAR Dataset/features.txt")
meanstd.grepl <- grepl("mean", feature.name[,2]) | grepl("std",feature.name[,2])
x.merge.extract <- x.merge[,meanstd.grepl]

## Add column names to x.merge.extract
feature.name.2 <- gsub("\\()", "", feature.name[,2])
feature.name.3 <- feature.name.2[meanstd.grepl]
colnames(x.merge.extract) <- feature.name.3
x.merge.extract <- as.data.frame(x.merge.extract)

## Read and merge y train and test data
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y.merge <- rbind(y.train, y.test)
colnames(y.merge) <- "act_num"
dim(y.merge)

## Read activity labels
act.label <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(act.label) <- c("act_num", "act_label")

## Merge y with activity lables
y.merge.label <- merge(y.merge, act.label, by.x = "act_num", by.y = "act_num" )

## Add a column with activity labels to x.merge.extract
x.merge.extract$act_label <- y.merge.label$act_label

## Add a column with subject number to x.merge.extract
subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject.merge <- rbind(subject.train, subject.test)
colnames(subject.merge) <- "subject"
x.merge.extract$subject <- subject.merge$subject

## Move subject and activity columsn to be 1st and 2nd columns
col.num <- ncol(x.merge.extract)
x.merge.extract <- x.merge.extract[,c(col.num, col.num-1, 1:(col.num-2))]

## Create a factor concatnate subject and activity columns
fac.subject.act <- paste("Sub", x.merge.extract$subject, x.merge.extract$act_label)

## Step 5 ##
## Aggregate (mean) data by subject and activity
x.agg <- aggregate(x.merge.extract[,-c(1,2)], by=list(fac.subject.act), FUN="mean")

## end






                                 
