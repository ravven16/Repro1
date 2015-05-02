---
title: "Code Book for run_analysis"
author: "Ravi Venkatesh"
date: "Saturday, May 02, 2015"
output: html_document
---

##Description of Script Run_Analysis.R

        * Files below are downloaded to R
                + "features.txt"
                + "activity_labels.txt"
                + "subject_test.txt"
                + "subject_train.txt"
                + "X_test.txt"
                + "X_train.txt"
                + "y_test.txt"
                + "y_train.txt"
        * The test and train files are merged using the r command rbind and a total set file containing both training and test data is formed.
        * column name from the file "features" is added to the merged set file
        * columnn names with mean and std values from total set files are extracted using grep.
        * the columns with mean and std values are derived from total set using subsetting
        *The columns subject and activity label are added to the newly formed meanstd_total dataset using cbind
        * The activity label in the new data set is converted as a factor and names of level is renamed with description in the activity file
        * Aggregation is done based on activity label and subject and the file is written to output as tidy_file.txt
        
        
## Fields

The fields in the file comes from the mean and std values of accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. More details are availables in the file "features_info.txt" which is available in the link provided below

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The fields of the file "tidy_file.txt" are listed below

        "Subject"
        "ActivityLabel"
        "tBodyAcc-mean()-X"
        "tBodyAcc-mean()-Y"
        "tBodyAcc-mean()-Z"
        "tBodyAcc-std()-X"
        "tBodyAcc-std()-Y"
        "tBodyAcc-std()-Z"
        "tGravityAcc-mean()-X"
        "tGravityAcc-mean()-Y"
        "tGravityAcc-mean()-Z"
        "tGravityAcc-std()-X"
        "tGravityAcc-std()-Y"
        "tGravityAcc-std()-Z"
        "tBodyAccJerk-mean()-X"
        "tBodyAccJerk-mean()-Y"
        "tBodyAccJerk-mean()-Z"
        "tBodyAccJerk-std()-X"
        "tBodyAccJerk-std()-Y"
        "tBodyAccJerk-std()-Z"
        "tBodyGyro-mean()-X"
        "tBodyGyro-mean()-Y"
        "tBodyGyro-mean()-Z"
        "tBodyGyro-std()-X"
        "tBodyGyro-std()-Y"
        "tBodyGyro-std()-Z"
        "tBodyGyroJerk-mean()-X"
        "tBodyGyroJerk-mean()-Y"
        "tBodyGyroJerk-mean()-Z"
        "tBodyGyroJerk-std()-X"
        "tBodyGyroJerk-std()-Y"
        "tBodyGyroJerk-std()-Z"
        "tBodyAccMag-mean()"
        "tBodyAccMag-std()"
        "tGravityAccMag-mean()"
        "tGravityAccMag-std()"
        "tBodyAccJerkMag-mean()"
        "tBodyAccJerkMag-std()"
        "tBodyGyroMag-mean()"
        "tBodyGyroMag-std()"
        "tBodyGyroJerkMag-mean()"
        "tBodyGyroJerkMag-std()"
        "fBodyAcc-mean()-X"
        "fBodyAcc-mean()-Y"
        "fBodyAcc-mean()-Z"
        "fBodyAcc-std()-X"
        "fBodyAcc-std()-Y"
        "fBodyAcc-std()-Z"
        "fBodyAcc-meanFreq()-X"
        "fBodyAcc-meanFreq()-Y"
        "fBodyAcc-meanFreq()-Z"
        "fBodyAccJerk-mean()-X"
        "fBodyAccJerk-mean()-Y"
        "fBodyAccJerk-mean()-Z"
        "fBodyAccJerk-std()-X"
        "fBodyAccJerk-std()-Y"
        "fBodyAccJerk-std()-Z"
        "fBodyAccJerk-meanFreq()-X"
        "fBodyAccJerk-meanFreq()-Y"
        "fBodyAccJerk-meanFreq()-Z"
        "fBodyGyro-mean()-X"
        "fBodyGyro-mean()-Y"
        "fBodyGyro-mean()-Z"
        "fBodyGyro-std()-X"
        "fBodyGyro-std()-Y"
        "fBodyGyro-std()-Z"
        "fBodyGyro-meanFreq()-X"
        "fBodyGyro-meanFreq()-Y"
        "fBodyGyro-meanFreq()-Z"
        "fBodyAccMag-mean()"
        "fBodyAccMag-std()"
        "fBodyAccMag-meanFreq()"
        "fBodyBodyAccJerkMag-mean()"
        "fBodyBodyAccJerkMag-std()"
        "fBodyBodyAccJerkMag-meanFreq()"
        "fBodyBodyGyroMag-mean()"
        "fBodyBodyGyroMag-std()"
        "fBodyBodyGyroMag-meanFreq()"
        "fBodyBodyGyroJerkMag-mean()"
        "fBodyBodyGyroJerkMag-std()"
        "fBodyBodyGyroJerkMag-meanFreq()"
