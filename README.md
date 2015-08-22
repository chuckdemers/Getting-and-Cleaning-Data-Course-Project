# Getting-and-Cleaning-Data-Course-Project

When the script runs it does the following to tranform the data into the file "tiny_data_set.txt"

#### Read the data files

1.  The labels and features are first read.  This way they are able to be applied to dataset as they are read in.
    - labels
	- features
```
labels   <- read.table("./UCI HAR Dataset/activity_labels.txt", sep="",
            header=FALSE)
colnames(labels) <- c("Label","Activity")
features <- read.table("./UCI HAR Dataset/features.txt", sep="", header=FALSE)
```
2.  The train data is loaded. 
    - subject
	- X data, once loaded the colunms are named
	- Y data, once loaded the colunms are named, then the activity ID is transformed to the activity label
```
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
```
3.  The train data is merged into one dataset
```
merged_train      <- data.frame( subject, activity, x)
```
4.  The test data is loaded. 
    - subject
	- X data, once loaded the colunms are named
	- Y data, once loaded the colunms are named, then the activity ID is transformed to the activity label
```
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
```
5.  The test data is merged into one dataset
```
merged_test       <- data.frame( subject, activity, x)
```

#### Merge the datasets

6.  The two datasets train and test are merged into one dataset
```
merged_data   <- rbind( merged_test, merged_train)
```

#### Extract only mean and standard deviation measurements

7.  The data columns including the phrase mean and std are selected along with the identifier columns Subject and Activity.
```
mean_std_cols <- grep( "Subject|Activity|mean|std", colnames(merged_test),
                       ignore.case=TRUE)
data          <- as.data.table(merged_data[,mean_std_cols])
```
#### Tranform the data

8. Calculate the mean for each Subject and Activity for each data column
```
calced_data   <- data[ , lapply(.SD, mean), by=c("Subject","Activity")]
```

#### Write out the data

9. Write the data to a file called "tiny_data_set.txt" without using row names
```
write.table(calced_data, "tiny_data_set.txt",row.names=FALSE)
```

