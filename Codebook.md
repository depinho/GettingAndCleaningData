# 								Codebook

This document describes the data and any transformations or work that was performed to clean it up.        It also provides a description of the variables (columns) in the tidy data set created.

Here is the link to the data for this project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data contains the results of experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

 

The run_analysis.R script performs the steps described below. The code is commented to help understand each step and when each requirement is met it's indicated with the respective number (1-5).



1. **Merges the training and the test sets to create one data set.**

   After unzipping the data, some exploration of the files was performed to understand how the data fitted into each other, namely looking at table dimensions. It was concluded the relevant files to be processed to create the tidy data set are:

   |      File Name      |         Description of contents          |
   | :-----------------: | :--------------------------------------: |
   |     X_train.txt     |            Training data set             |
   |     y_train.txt     |         Training activity labels         |
   |  subject_train.txt  |   Subjects who performed the activity    |
   |     X_test.txt      |              Test data set               |
   |     y_test.txt      |           Test activity labels           |
   |  subject_test.txt   |   Subjects who performed the activity    |
   | activity_labels.txt | Links the activity ID with respective activity name |
   |    features.txt     | List of all features measured (see below for further information) |

    

   And below is is how the data from the different files should be merged. In R, this corresponds to the data frame OneDataSet1.

   ![DataMergeView](https://github.com/depinho/GettingAndCleaningData/blob/master/DataMergeView.png)

**2 .Extracts only the measurements on the mean and standard deviation for each measurement.** 

For the tidy data set created for this project, only the measurements on the mean and standard deviation were used. This was done by selecting variable names that contained the words "mean" and "std", using the grep function in R.

In R, this corresponds to the data frame OneDataSet2.



**3. Uses descriptive activity names to name the activities in the data set**

This was done in R by using the lookup function to replace ID with the corresponding Activity Name.

In R, this corresponds to the data frame OneDataSet3.



**4. Appropriately labels the data set with descriptive variable names** 

The X_test.txt and X_train.txt files contains the features/measurements from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern, where '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

In order to make the variable names descriptive the following steps were performed:

- Made them all lower case where possible
- Replaced chars -,) and ( with no space
- Replaced t with time to make it easier to understand it's a time domain variable
- Replaced f with freq to make it easier to understand it's a frequency domain variable

The final list of variables in the produced data set is the following:

|          Variable Name          |               Description                |
| :-----------------------------: | :--------------------------------------: |
|            subjectid            | Identifies the subject who performed the activity, range is from 1 to 30. |
|          activityname           | One of six activities perfomed by subject: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING |
|        timebodyaccmeanx         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodyaccmeany         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodyaccmeanz         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|         timebodyaccstdx         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|         timebodyaccstdy         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|         timebodyaccstdz         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timegravityaccmeanx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timegravityaccmeany       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timegravityaccmeanz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timegravityaccstdx        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timegravityaccstdy        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timegravityaccstdz        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodyaccjerkmeanx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodyaccjerkmeany       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodyaccjerkmeanz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timebodyaccjerkstdx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timebodyaccjerkstdy       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timebodyaccjerkstdz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodygyromeanx        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodygyromeany        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodygyromeanz        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodygyrostdx         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodygyrostdy         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodygyrostdz         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodygyrojerkmeanx      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodygyrojerkmeany      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodygyrojerkmeanz      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodygyrojerkstdx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodygyrojerkstdy       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodygyrojerkstdz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timebodyaccmagmean        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        timebodyaccmagstd        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timegravityaccmagmean      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timegravityaccmagstd       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|     timebodyaccjerkmagmean      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      timebodyaccjerkmagstd      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timebodygyromagmean       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       timebodygyromagstd        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|     timebodygyrojerkmagmean     | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|     timebodygyrojerkmagstd      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodyaccmeanx         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodyaccmeany         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodyaccmeanz         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|         freqbodyaccstdx         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|         freqbodyaccstdy         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|         freqbodyaccstdz         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodyaccmeanfreqx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodyaccmeanfreqy       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodyaccmeanfreqz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodyaccjerkmeanx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodyaccjerkmeany       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodyaccjerkmeanz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       freqbodyaccjerkstdx       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       freqbodyaccjerkstdy       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       freqbodyaccjerkstdz       | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|    freqbodyaccjerkmeanfreqx     | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|    freqbodyaccjerkmeanfreqy     | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|    freqbodyaccjerkmeanfreqz     | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodygyromeanx        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodygyromeany        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodygyromeanz        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodygyrostdx         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodygyrostdy         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodygyrostdz         | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodygyromeanfreqx      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodygyromeanfreqy      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|      freqbodygyromeanfreqz      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|       freqbodyaccmagmean        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|        freqbodyaccmagstd        | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|     freqbodyaccmagmeanfreq      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|   freqbodybodyaccjerkmagmean    | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|    freqbodybodyaccjerkmagstd    | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
| freqbodybodyaccjerkmagmeanfreq  | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|     freqbodybodygyromagmean     | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|     freqbodybodygyromagstd      | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|   freqbodybodygyromagmeanfreq   | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|   freqbodybodygyrojerkmagmean   | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
|   freqbodybodygyrojerkmagstd    | See above for detailed description.                                     Normalized and bounded within [-1,1]. |
| freqbodybodygyrojerkmagmeanfreq | See above for detailed description.                                     Normalized and bounded within [-1,1]. |



In R, this corresponds to the data frame OneDataSet4.

**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

In order to achieve this, the group_by function in R was used to create pairs of subjects and activities (30 x 6) , followed by the summarise function in combination with means to calculate the average of each variable. 

This is the final step required to have a tidy data set, meaning one observation per row and one variable per column. 

In R, this corresponds to the data frame TidyDataSet, with 180 rows (observations)  and 81 columns (variables).

The respective output file is TidyDataSet.txt.



