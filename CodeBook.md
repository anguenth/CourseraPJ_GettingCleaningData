###############################################################
#######             Codebook - Course Project        ##########
###############################################################



1.) GETTING DATA

- the variables used in the analysis are drawn from
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%
  2FUCI%20HAR%20Dataset.zip 
- the data needs to be unzipped to the working directory

2.) BUILDING THE RELEVANT DATA SET

- Input Files:
      General descriptive data 
      "UCI HAR Dataset/activity_labels.txt"
      "UCI HAR Dataset/features.txt"
      
      Calculated measures and environment-related setup data
      "UCI HAR Dataset/train/X_train.txt"    
      "UCI HAR Dataset/train/y_train.txt"             
      "UCI HAR Dataset/train/subject_train.txt"
      "UCI HAR Dataset/test/X_test.txt"
      "UCI HAR Dataset/test/y_test.txt"
      "UCI HAR Dataset/test/subject_test.txt"

- combining X_train and X_test data sets to one (rbind)
- searching for relevant columns representing "mean()" and "std()" (grep)
- adding new column "activity" with activity names instead of just the ids
  (merging activity_lables.txt with y_*.txt data) 
- adding new column subject identifiers 
- melt the data structure down to columns "activity", "subject", "variable"
  "value"


3.) DICTIONARY OF THE DATA AS PREPARED FOR THE ANALYSIS

activity    
	WALKING
	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

subject	
	1..30 (id of a person)

the notation of following variables can be described for all:
  - prefix "t" denotes time domain data, 
    prefix "f" denotes frequency domain signals coming from
    the Fast Fourier Transformation
  - "GravityAcc": total acceleration as measured by accelerometer
  - "BodyAcc": total acceleration minus gravity 
  - "BodyGyro":  angular velocity as measured by a gyroscope 
  - "Mag": Magnitude
  - "Jerk": Jerk  
  - all were estimated from signal-data by calculating
    the mean value (mean()) or the standard deviation (sd())
  - all data is bounded within [-1,1]

tBodyAccJerk-mean()-X
tBodyGyro-mean()-X
tBodyGyroJerk-mean()-X
tBodyAccMag-mean()
tBodyGyroMag-mean()
fBodyAcc-mean()-Z
fBodyAccJerk-mean()-Z
fBodyGyro-mean()-Z
fBodyBodyAccJerkMag-mean()
tBodyAcc-mean()-X
tGravityAcc-mean()-X
tBodyAccJerk-mean()-Y
tBodyGyro-mean()-Y
tBodyGyroJerk-mean()-Y
tBodyAccMag-std()
tBodyGyroMag-std()
fBodyAcc-std()-X
fBodyAccJerk-std()-X
fBodyGyro-std()-X
fBodyBodyAccJerkMag-std()
tBodyAcc-mean()-Y
tGravityAcc-mean()-Y
tBodyAccJerk-mean()-Z
tBodyGyro-mean()-Z
tBodyGyroJerk-mean()-Z
tGravityAccMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-std()-Y
fBodyAccJerk-std()-Y
fBodyGyro-std()-Y
fBodyBodyGyroMag-mean()
tBodyAcc-mean()-Z
tGravityAcc-mean()-Z
tBodyAccJerk-std()-X
tBodyGyro-std()-X
tBodyGyroJerk-std()-X
tGravityAccMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-Z
fBodyAccJerk-std()-Z
fBodyGyro-std()-Z
fBodyBodyGyroMag-std()
tBodyAcc-std()-X
tGravityAcc-std()-X
tBodyAccJerk-std()-Y
tBodyGyro-std()-Y
tBodyGyroJerk-std()-Y
tBodyAccJerkMag-mean()
fBodyAcc-mean()-X
fBodyAccJerk-mean()-X
fBodyGyro-mean()-X
fBodyAccMag-mean()
fBodyBodyGyroJerkMag-mean()
tBodyAcc-std()-Y
tGravityAcc-std()-Y
tBodyAccJerk-std()-Z
tBodyGyro-std()-Z
tBodyGyroJerk-std()-Z
tBodyAccJerkMag-std()
fBodyAcc-mean()-Y
fBodyAccJerk-mean()-Y
fBodyGyro-mean()-Y
fBodyAccMag-std()
fBodyBodyGyroJerkMag-std()


4.) ANALYSIS

- using dcast() to calculate the mean for nested groups
