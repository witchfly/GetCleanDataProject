Code Book
=========

The run_analysis.R script uses data from the Human Activity Recognition Using
SmartPhone and create a tidy data. The tidy data set is average of each variable
for each activity and each subject. 

Available Data
--------------
There are two sets of data, Train and Test. And per each train and test, there 
are 561 variables. The variables are many signals captured using smart phone's 
embedded accelerometer and gyroscope. There also is subject and activity in each
train and test set.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels. Activities.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels. Activities.
- 'train/subject_train.txt': Each row identifies the subject who performed the 
activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_test.txt': same as subject_train.txt but for test.

Cleaning Data
-------------
First, read activity data from train and test and then combine them to make one
activity data. Then, use descriptive activity names from the 
'activity_labels.txt" to name the activities in the data set using sapply. 

Second, read subject data from train and test and combine them to make one 
subject data. Then, create a new data frame with Subject and Activity. 

Third, read "features.txt" and use grep to extract only mean and standard
deviation measurements for a tidy data purpose from each train and test set.
Then, combine those measures into one with descriptive variable label names.

Fourth, average variables for each activity and each subject. This is the tidy
data! Using write.table, write a tidy data to a text file. 

Tidy Data 
---------
* Subject: 1 to 30, 30 volunteers 
* Activity: 6 activities, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Variables: 66 variables, that are mean and standard deviation measures
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z"         
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z"      
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X"         
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y"    
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z"     
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()"      
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()"        
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y"         
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z"          
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X"      
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y"        
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()