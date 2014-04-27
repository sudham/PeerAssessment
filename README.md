

This is the README file for the script run_analysis.R created for the "Getting and Cleaning Data" Peer Assignment 2.

##Input Data set

Download the data set and extract into a UCI HAR Dataset folder to obtain the following : 
1.	README.txt
2.	features_info.txt: Shows information about the variables used on the feature vector.
3.	features.txt: List of all features
4.	activity_labels.txt: Links the class labels with their activity name.
5.	train/X_train.txt: Training set
6.	train/y_train.txt: Training labels
7.	test/X_test.txt: Test set
8.	test/y_test.txt: Test labels
9.	train/subject_train.txt: subject
10.	test/subject_train.txt: subject
11.	Files under test/Inertial Signals and train/Inertial Signals (these are not used for the analysis)


##Output Data set
The script creates a directory results under UCI HAR Dataset to store following files :
1.	TidyMergedData.csv -  tidy data
2.	DatasetwithMeans.csv - data with average of the feature measurements


##Running the Script
1.	Change current directory to the UCI HAR Dataset  folder.
2.	Run {Rscript <path to>/run_analysis.R}


##Data Preparation 
1.	Check if required package reshape2 is installed and loaded
2.	Create results folder to save resulting data sets as .csv files 
3.	Read the test and training data - X_train X_test, Y_train and Y_test, Subjects_train, Subjects_test from respective directories and merge to get XData, YData and Subjects
4.	Read the features and activities data
5.	Create filter for extracting std and mean values from XData and name the columns accordingly.
6.	Replace activity index with activity in YData. Add descriptive colnames for combined YData as Activity and subjects as Subjects
7.	Create tidy data set by cbind Subjects, YData and XData and save as TidyMergedData.csv
8.	Create a second, independent tidy data set with the mean of each variable for each activity and each subject and save as DatasetwithMeans.csv
