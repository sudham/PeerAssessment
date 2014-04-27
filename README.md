

This is the README file for the script run_analysis.R created for the "Getting and Cleaning Data" Peer Assignment 2.

##Input Data set

Download the data set and extract into a UCI HAR Dataset folder to obtain the following : 

* README.txt
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features
* activity_labels.txt: Links the class labels with their activity name.
* train/X_train.txt: Training set
* train/y_train.txt: Training labels
* test/X_test.txt: Test set
* test/y_test.txt: Test labels
* train/subject_train.txt: subject
* test/subject_train.txt: subject
* Files under test/Inertial Signals and train/Inertial Signals (these are not used for the analysis)


##Output Data set
The script creates a directory results under UCI HAR Dataset to store following files :

* TidyMergedData.txt -  tidy data
* DatasetwithMeans.txt - data with average of the feature measurements

These files can be read using Excel as they are comma separated


##Running the Script

1. Change current directory to the UCI HAR Dataset folder
2. Run 
            Rscript <path>/run_analysis.R


##Data Preparation 
1.	Check if required package reshape2 is installed and loaded
2.	Create results folder to save resulting data sets as .txt files 
3.	Read the test and training data - X_train X_test, Y_train and Y_test, Subjects_train, Subjects_test from respective directories and merge to get XData, YData and Subjects
4.	Read the features and activities data
5.	Create filter for extracting std and mean values from XData and name the columns accordingly.
6.	Replace activity index with activity in YData. Add descriptive colnames for combined YData as Activity and subjects as Subjects
7.	Create tidy data set by cbind Subjects, YData and XData and save as TidyMergedData.txt
8.	Create a second, independent tidy data set with the mean of each variable for each activity and each subject and save as DatasetwithMeans.txt
