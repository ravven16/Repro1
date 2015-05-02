#Human Activity Recognition Using Smartphones

## Data Collection
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

##Data Availability

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


## Record Details
For each record it is provided:

        * Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
        * Triaxial Angular velocity from the gyroscope. 
        * A 561-feature vector with time and frequency domain variables. 
        * Its activity label. 
        * An identifier of the subject who carried out the experiment.

## File Information
The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels

- 'tidy_file.txt' : The above file is generated when the script file run_analysis.R is executed. It provides the mean value for each activity for each Subject. The file has 83 columns with Subject, Activity Label and the 81 columns of mean and std variables i.e found in the oiginal dataset

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

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
        
        
