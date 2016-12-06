# CodeBook for the tidy dataset

*Getting and Cleaning Data Project from Johns Hopkins Bloomberg School of Public Health*

Author: [Herson Melo](mailto:hersonpc@gmail.com)

___

> This code book describe the result data fields in [tidy.csv](./tidy.csv).

## Data source

This dataset is derived from the ***Human Activity Recognition Using Smartphones Data Set***, provide by Machine Learning Repository from [UCI](http://archive.ics.uci.edu/ml/).

Avaliable here: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Dimensions (Identifiers)

| Field               | Description                                                  |
|---------------------|--------------------------------------------------------------|
| `activity_id` | The activity ID |
| `activity` | The action that was being performed when the measurement was recorded.  |
| `subject_id` | The ID of the test subject |

## Feature Selection (Measures)

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each one direction: X, Y and Z directions.


The set of variables that were estimated from *Mean value* (`mean()`) and *Standard deviation* (`std()`)


+ `tBodyAcc-mean()-X`
+ `tBodyAcc-mean()-Y`
+ `tBodyAcc-mean()-Z`
+ `tBodyAcc-std()-X`
+ `tBodyAcc-std()-Y`
+ `tBodyAcc-std()-Z`
+ `tGravityAcc-mean()-X`
+ `tGravityAcc-mean()-Y`
+ `tGravityAcc-mean()-Z`
+ `tGravityAcc-std()-X`
+ `tGravityAcc-std()-Y`
+ `tGravityAcc-std()-Z`
+ `tBodyAccJerk-mean()-X`
+ `tBodyAccJerk-mean()-Y`
+ `tBodyAccJerk-mean()-Z`
+ `tBodyAccJerk-std()-X`
+ `tBodyAccJerk-std()-Y`
+ `tBodyAccJerk-std()-Z`
+ `tBodyGyro-mean()-X`
+ `tBodyGyro-mean()-Y`
+ `tBodyGyro-mean()-Z`
+ `tBodyGyro-std()-X`
+ `tBodyGyro-std()-Y`
+ `tBodyGyro-std()-Z`
+ `tBodyGyroJerk-mean()-X`
+ `tBodyGyroJerk-mean()-Y`
+ `tBodyGyroJerk-mean()-Z`
+ `tBodyGyroJerk-std()-X`
+ `tBodyGyroJerk-std()-Y`
+ `tBodyGyroJerk-std()-Z`
+ `tBodyAccMag-mean()`
+ `tBodyAccMag-std()`
+ `tGravityAccMag-mean()`
+ `tGravityAccMag-std()`
+ `tBodyAccJerkMag-mean()`
+ `tBodyAccJerkMag-std()`
+ `tBodyGyroMag-mean()`
+ `tBodyGyroMag-std()`
+ `tBodyGyroJerkMag-mean()`
+ `tBodyGyroJerkMag-std()`
+ `fBodyAcc-mean()-X`
+ `fBodyAcc-mean()-Y`
+ `fBodyAcc-mean()-Z`
+ `fBodyAcc-std()-X`
+ `fBodyAcc-std()-Y`
+ `fBodyAcc-std()-Z`
+ `fBodyAccJerk-mean()-X`
+ `fBodyAccJerk-mean()-Y`
+ `fBodyAccJerk-mean()-Z`
+ `fBodyAccJerk-std()-X`
+ `fBodyAccJerk-std()-Y`
+ `fBodyAccJerk-std()-Z`
+ `fBodyGyro-mean()-X`
+ `fBodyGyro-mean()-Y`
+ `fBodyGyro-mean()-Z`
+ `fBodyGyro-std()-X`
+ `fBodyGyro-std()-Y`
+ `fBodyGyro-std()-Z`
+ `fBodyAccMag-mean()`
+ `fBodyAccMag-std()`
+ `fBodyBodyAccJerkMag-mean()`
+ `fBodyBodyAccJerkMag-std()`
+ `fBodyBodyGyroMag-mean()`
+ `fBodyBodyGyroMag-std()`
+ `fBodyBodyGyroJerkMag-mean()`
+ `fBodyBodyGyroJerkMag-std()`


## Units 

Fot Activity we have 6 types of possibilities

| ACTIVITY TYPE  | DESCRIPTION                                                             |
|----------------|-------------------------------------------------------------------------|
| `WALKING` | Indicates that the subject was walking during the test |
| `WALKING_UPSTAIRS` | Indicates that the subject was walking up a staircase during the test |
| `WALKING_DOWNSTAIRS` | Indicates that the subject was walking down a staircase during the test |
| `SITTING` | Indicates that the subject was sitting during the test |
| `STANDING` | Indicates that the subject was standing during the test |
| `LAYING` | Indicates that the subject was laying down during the test |






