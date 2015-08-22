##
##
## Getting and Cleaning Data
## Class Project
## Chuck Demers
##
## run_analysis.R
##
library("data.table")

#download_file = "getdata-projectfiles-UCI HAR Dataset.zip"
## Downloading Data

## Load the data descriptions
##
## The data is expected to be in the current working directory

labels   <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="",
            header=FALSE)
colnames(labels) <- c("Label","Activity")
features <- read.table("./UCI HAR Dataset/features.txt", sep="", header=FALSE)

## Load and Merge Subject, Activity, Tests for train subjects

subject           <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                                sep="", header=FALSE)
colnames(subject) <- c("Subject")
x                 <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="",
                                header=FALSE)
colnames(x)       <- features$V2
y                 <- read.table("./UCI HAR Dataset/train/y_train.txt", sep="",
                                header=FALSE)
colnames(y)       <- c("Label")
activity          <- merge(y, labels, by="Label")
activity$Label    <- NULL
merged_train      <- data.frame( subject, activity, x)

## Load and Merge Subject, Activity, Tests for test subjects

subject           <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                                sep="", header=FALSE)
colnames(subject) <- c("Subject")
x                 <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="",
                                header=FALSE)
colnames(x)       <- features$V2
y                 <- read.table("./UCI HAR Dataset/test/y_test.txt", sep="",
                                header=FALSE)
colnames(y)       <- c("Label")
activity          <- merge(y, labels, by="Label")
activity$Label    <- NULL
merged_test       <- data.frame( subject, activity, x)

## Create one merged data frame
merged_data   <- rbind( merged_test, merged_train)

# Determine columns to keep
mean_std_cols <- grep( "Subject|Activity|mean|std", colnames(merged_test),
                       ignore.case=TRUE)

# Select the columns being kept
data          <- as.data.table(merged_data[,mean_std_cols])

# take the average of the variables for each Subject/Activity pair
calced_data   <- data[ , lapply(.SD, mean), by=c("Subject","Activity")]

## Write the data to the output file
write.table(calced_data, "tiny_data_set.txt",row.names=FALSE)

