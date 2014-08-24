# Code book #

The function getUCIHARTidyDataSet() processes the data downloadable at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

The actions performed by the function are the following:

* load the file UCI HAR Dataset/test/X_test.txt
* adding column names using the descriptions in UCI HAR Dataset/features.txt
* loading the file UCI HAR Dataset/test/y_test.txt adding the activity descriptions found in UCI HAR Dataset/activity_labels.txt
* subsetting the data frame taking only columns with mean() and std() in their column names

* load the file UCI HAR Dataset/train/X_train.txt
* adding column names using the descriptions in UCI HAR Dataset/features.txt
* loading the file UCI HAR Dataset/train/y_train.txt adding the activity descriptions found in UCI HAR Dataset/activity_labels.txt
* subsetting the data frame taking only columns with mean() and std() in their column names

* appending the two data frame
* computing the average of the mean() and std() columns grouping by activity and subject.

The function returns a data frame with the following variables:
* Activity: the value ranges between the following
 * WALKING
 * WALKING_UPSTAIRS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING
* Subject: identifies the subject who performed the activity. Its range is from 1 to 30.
* AVG_tBodyAcc-mean()-X
* AVG_tBodyAcc-mean()-Y
* AVG_tBodyAcc-mean()-Z
* AVG_tBodyAcc-std()-X
* AVG_tBodyAcc-std()-Y
* AVG_tBodyAcc-std()-Z
* AVG_tGravityAcc-mean()-X
* AVG_tGravityAcc-mean()-Y
* AVG_tGravityAcc-mean()-Z
* AVG_tGravityAcc-std()-X
* AVG_tGravityAcc-std()-Y
* AVG_tGravityAcc-std()-Z
* AVG_tBodyAccJerk-mean()-X
* AVG_tBodyAccJerk-mean()-Y
* AVG_tBodyAccJerk-mean()-Z
* AVG_tBodyAccJerk-std()-X
* AVG_tBodyAccJerk-std()-Y
* AVG_tBodyAccJerk-std()-Z
* AVG_tBodyGyro-mean()-X
* AVG_tBodyGyro-mean()-Y
* AVG_tBodyGyro-mean()-Z
* AVG_tBodyGyro-std()-X
* AVG_tBodyGyro-std()-Y
* AVG_tBodyGyro-std()-Z
* AVG_tBodyGyroJerk-mean()-X
* AVG_tBodyGyroJerk-mean()-Y
* AVG_tBodyGyroJerk-mean()-Z
* AVG_tBodyGyroJerk-std()-X
* AVG_tBodyGyroJerk-std()-Y
* AVG_tBodyGyroJerk-std()-Z
* AVG_tBodyAccMag-mean()
* AVG_tBodyAccMag-std()
* AVG_tGravityAccMag-mean()
* AVG_tGravityAccMag-std()
* AVG_tBodyAccJerkMag-mean()
* AVG_tBodyAccJerkMag-std()
* AVG_tBodyGyroMag-mean()
* AVG_tBodyGyroMag-std()
* AVG_tBodyGyroJerkMag-mean()
* AVG_tBodyGyroJerkMag-std()
* AVG_fBodyAcc-mean()-X
* AVG_fBodyAcc-mean()-Y
* AVG_fBodyAcc-mean()-Z
* AVG_fBodyAcc-std()-X
* AVG_fBodyAcc-std()-Y
* AVG_fBodyAcc-std()-Z
* AVG_fBodyAccJerk-mean()-X
* AVG_fBodyAccJerk-mean()-Y
* AVG_fBodyAccJerk-mean()-Z
* AVG_fBodyAccJerk-std()-X
* AVG_fBodyAccJerk-std()-Y
* AVG_fBodyAccJerk-std()-Z
* AVG_fBodyGyro-mean()-X
* AVG_fBodyGyro-mean()-Y
* AVG_fBodyGyro-mean()-Z
* AVG_fBodyGyro-std()-X
* AVG_fBodyGyro-std()-Y
* AVG_fBodyGyro-std()-Z
* AVG_fBodyAccMag-mean()
* AVG_fBodyAccMag-std()
* AVG_fBodyBodyAccJerkMag-mean()
* AVG_fBodyBodyAccJerkMag-std()
* AVG_fBodyBodyGyroMag-mean()
* AVG_fBodyBodyGyroMag-std()
* AVG_fBodyBodyGyroJerkMag-mean()
* AVG_fBodyBodyGyroJerkMag-std()

All the AVG_* variables are the average of the corresponding variables found in the test and train dataset:
* UCI HAR Dataset/train/X_test.txt
* UCI HAR Dataset/train/X_train.txt

The average is computed grouping by activity and subject.
At the end the resulting data frame returned by getUCIHARTidyDataSet() will contains a row per every different value of the couple (activity, subject).
