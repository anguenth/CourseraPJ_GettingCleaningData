# CourseraPJ_GettingCleaningData
course project - get data, data management, mean on variables in multiple groups


1. INTRODUCTION

  There is just one script (run_analysis.R) that analyses
  data providing information about the forces occuring while moving 
  a mobile device.
  The data are collected by 30 volunteers in different
  activity scenarios where acceleration and angular velocity 
  have been recorded in certain intervals.



2. FILES

  run_analysis.R
  - the file can be run from the working directory
  - prerequisite is to download Samsung data from
    https://d396qusza40orc.cloudfront.net/getdata%2Fproject
    files%2FUCI%20HAR%20Dataset.zip 
    and unzip it to the working directory
  - the script combines 2 datasets (train/test) first and 
    calculates the mean of all variables grouped by the
    kind of activity and the person who conducted the measurements
  - the output will be on the screen as well as in the 
    file "tidyDataset.txt" in the working directory

  CodeBook.md
  - describes the variables, the data, and any data management 
    step to clean the data




3. DATA BASE - DOWNLOADS

  Source:
    https://d396qusza40orc.cloudfront.net/getdata%2Fproject
    files%2FUCI%20HAR%20Dataset.zip

  Files used in the analysis
  - 'README.txt'
  - 'features_info.txt': Shows information about the variables used on the feature vector.
  - 'features.txt': List of all features.
  - 'activity_labels.txt': Links the class labels with their activity name.
  - 'train/X_train.txt': Training set.
  - 'train/y_train.txt': Training labels.
  - 'test/X_test.txt': Test set.
  - 'test/y_test.txt': Test labels

  Files not used in the analysis
  - all files in the "Inertial Signals"-Folders are NOT relevant 
    to the analysis
