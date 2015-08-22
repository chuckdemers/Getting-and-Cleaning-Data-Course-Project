
# Codebook

This codebook describes the variables, data and transformations performed to transition the raw data into the tidy data set.  It is broken into 4 section.

1. Raw Data, which summarization of the description in the codebook provided with the data.
2. Transformation, which describes the process required by the assignment to transform the data.  The associated README.md file includes a descprition of the R script used.
3. Tiny Data Set, which provides the information around the variables within the transformed dataset
4. References, as required by the source dataset the referring paper is included.

## Raw Data

The description of the data represented in this codebook is taken either directly from the raw data, or is enterpreted from that data.

### Location

The raw data comes from the following URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### README.txt

The following sections describe the experiments, and the collected data.  It is from the README.txt file

#### Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### Data Files


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Transformation

The R scrit run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy Data Set

The tiny data set created in step 5 is 'tiny_data_set.txt'

### Data Set Variables

Subject                             

    The Subject is the identifier for the person that underwent testing or training

Activity                            

    The Activity is the description of the activity performed while the measurements were taken

Additional Measurements

    The following values are from the data collected, then tranformed by the run_analysis.R script.  Each of the variables represent the mean of the raw transformed data for that variable by Subject and Activity

	tBodyAcc.mean...X                   
	tBodyAcc.mean...Y                   
	tBodyAcc.mean...Z                   
	tBodyAcc.std...X                    
	tBodyAcc.std...Y                    
	tBodyAcc.std...Z                    
	tGravityAcc.mean...X                
	tGravityAcc.mean...Y                
	tGravityAcc.mean...Z                
	tGravityAcc.std...X                 
	tGravityAcc.std...Y                 
	tGravityAcc.std...Z                 
	tBodyAccJerk.mean...X               
	tBodyAccJerk.mean...Y               
	tBodyAccJerk.mean...Z               
	tBodyAccJerk.std...X                
	tBodyAccJerk.std...Y                
	tBodyAccJerk.std...Z                
	tBodyGyro.mean...X                  
	tBodyGyro.mean...Y                  
	tBodyGyro.mean...Z                  
	tBodyGyro.std...X                   
	tBodyGyro.std...Y                   
	tBodyGyro.std...Z                   
	tBodyGyroJerk.mean...X              
	tBodyGyroJerk.mean...Y              
	tBodyGyroJerk.mean...Z              
	tBodyGyroJerk.std...X               
	tBodyGyroJerk.std...Y               
	tBodyGyroJerk.std...Z               
	tBodyAccMag.mean..                  
	tBodyAccMag.std..                   
	tGravityAccMag.mean..               
	tGravityAccMag.std..                
	tBodyAccJerkMag.mean..              
	tBodyAccJerkMag.std..               
	tBodyGyroMag.mean..                 
	tBodyGyroMag.std..                  
	tBodyGyroJerkMag.mean..             
	tBodyGyroJerkMag.std..              
	fBodyAcc.mean...X                   
	fBodyAcc.mean...Y                   
	fBodyAcc.mean...Z                   
	fBodyAcc.std...X                    
	fBodyAcc.std...Y                    
	fBodyAcc.std...Z                    
	fBodyAcc.meanFreq...X               
	fBodyAcc.meanFreq...Y               
	fBodyAcc.meanFreq...Z               
	fBodyAccJerk.mean...X               
	fBodyAccJerk.mean...Y               
	fBodyAccJerk.mean...Z               
	fBodyAccJerk.std...X                
	fBodyAccJerk.std...Y                
	fBodyAccJerk.std...Z                
	fBodyAccJerk.meanFreq...X           
	fBodyAccJerk.meanFreq...Y           
	fBodyAccJerk.meanFreq...Z           
	fBodyGyro.mean...X                  
	fBodyGyro.mean...Y                  
	fBodyGyro.mean...Z                  
	fBodyGyro.std...X                   
	fBodyGyro.std...Y                   
	fBodyGyro.std...Z                   
	fBodyGyro.meanFreq...X              
	fBodyGyro.meanFreq...Y              
	fBodyGyro.meanFreq...Z              
	fBodyAccMag.mean..                  
	fBodyAccMag.std..                   
	fBodyAccMag.meanFreq..              
	fBodyBodyAccJerkMag.mean..          
	fBodyBodyAccJerkMag.std..           
	fBodyBodyAccJerkMag.meanFreq..      
	fBodyBodyGyroMag.mean..             
	fBodyBodyGyroMag.std..              
	fBodyBodyGyroMag.meanFreq..         
	fBodyBodyGyroJerkMag.mean..         
	fBodyBodyGyroJerkMag.std..          
	fBodyBodyGyroJerkMag.meanFreq..     
	angle.tBodyAccMean.gravity.         
	angle.tBodyAccJerkMean..gravityMean.
	angle.tBodyGyroMean.gravityMean.    
	angle.tBodyGyroJerkMean.gravityMean.
	angle.X.gravityMean.                
	angle.Y.gravityMean.                
	angle.Z.gravityMean.    

## Reference

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012d
