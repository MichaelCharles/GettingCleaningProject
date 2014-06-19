The raw data for this project is a set of accelerotometered and gyroscopic measurements from 
volunteers gathered from a smartphone they were wearing while performing an activity.  See 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
for a full desciption of the study.

The actual data is at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
This zip file contains 28 files with actual measurement data, including a READE.txt file 
describing the data. The original date is 11/2012.

run_analysis.R is a R script which transforms the data in the following manner:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
   The raw data lables for these particular measurements include either "mean" or "std".
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To run run_analysis.R

1.  Version Rx64 3.0.2 can be used.
2.  Download the raw data zip file to a local directory for use by R and extract the files.
    run_analysis.R requires the following files 
    ./test/subject_test.txt 
    ./test/X_test.txt       
    ./test/y_test.txt      
    ./train/subject_train.txt
    ./train/X_train.txt       
    ./train/y_train.txt
    ./features.txt
    ./activity_labels.txt
3.  run_analysis.R produces the following output:
    tidyData.txt in table format - 180 observations x 81 variables - no missing data, headers provided.
    The measurement header names match the original raw data header names, except non-alphanumerics are removed.
    For example, the original X-axis accelerometer average reading, tBodyAcc-mean()-X, has been relabled tBodyAccmeanX.  

This information is current as of 6/12/2014.
