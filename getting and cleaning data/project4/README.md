
## Peer-graded Assignment: Getting and Cleaning Data Course Project
This repository is for the submission for Getting and Cleaning Data course project. It has the instructions on how to run analysis on Human Activity recognition dataset.

**Dataset**
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
also data used is stored in *Data folder*

**Files**

1. CodeBook.Rmd a code book that describes the variables, the data, and work performed to clean the data
2. dataFetching.R in script folder for downloading the data
3. run_analysis.R in script folder which performs the data preparation and required steps as described in the course project’s
4. tidy_dataset.txt which is the exported data after completing the process below.


**process**

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


