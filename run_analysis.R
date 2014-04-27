#####################################################################################################
## File Name : run_analysis.R
## Purpose : This file contains the script to process
## Environment : The script requires 
## 1. Data downloaded and extracted under current working directory "UCI HAR Dataset"
#####################################################################################################
# 1. Check if required package reshape2 is installed and loaded
# 2. Create results folder to save resulting data sets as .csv files 
# 3. Read the test and training data - X_train and X_test, Y_train and Y_test, Subjects_train,
#    Subjects_test from respective directories and merge to get XData, YData and Subjects
# 4. Read the features and activities data
# 5. Create filter for extracting std and mean values from XData and
#    name cols accordingly. Replace activity index with activity in YData
#    Add descriptive colnames for combined YData as Activity and subjects as Subjects
# 8. Create tidy data set by cbind Subjects, YData and XData and save as TidyMergedData.csv
# 9. Create a second, independent tidy data set 
#    with the mean of each variable for each activity and each subject and save as DatasetwithMeans.csv
#####################################################################################################

#  Check if required package reshape2 is installed and loaded

        print("Executing script .....")
        if(!is.element("reshape2", installed.packages()[,1])){
                print("Installing packages")
                install.packages("reshape2")
               
        }
        library(reshape2)

# Create results folder to save resulting data sets as .csv files 

        result_folder <- "results"
        if(!file.exists(result_folder)){
                dir.create(result_folder)
        } 
    
# Read the test and training data - X_train and X_test, Y_train and Y_test, Subjects_train,
#    Subjects_test from respective directories and merge to get XData, YData and Subjects

        xdatatrain <- read.table("train/X_train.txt")
        xdatatest <- read.table("test/X_test.txt")
        XData <- rbind(xdatatrain, xdatatest)

        ydatatrain <- read.table("train/y_train.txt")
        ydatatest <- read.table("test/y_test.txt")
        YData <- rbind(ydatatrain, ydatatest)

        subjecttrain <- read.table("train/subject_train.txt")
        subjecttest <- read.table("test/subject_test.txt")
        Subjects <- rbind(subjecttrain, subjecttest)

# Read the features and activities data

        features <- read.table("features.txt")   
        data_cols <- grep(".*mean\\(\\)|.*std\\(\\)", features[, 2] )

        activities <- read.table("activity_labels.txt") 
        activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))

# Create filter for extracting std and mean values from XData and
#    name cols accordingly. Replace activity index with activity in YData
#    Add descriptive colnames for combined YData as Activity and subjects as Subjects

        XData <- XData[, data_cols]
        names(XData ) <- features[data_cols, 2]
        names(XData ) <- gsub("\\(|\\)", "", names(XData ))
        names(XData ) <- tolower(names(XData )) 

        YData[,1] = activities[YData[,1], 2]
        names(YData) <- "activity"    
        names(Subjects) <- "subject"

# Create tidy data set by cbind Subjects, YData and XData and save as TidyMergedData.csv   \

        tidyMergedData <- cbind(Subjects, YData, XData)
        write.table(tidyMergedData, paste0( result_folder, "/", "TidyMergedData.csv" ), sep = ",", row.names = FALSE)
        
# Create a second, independent tidy data set 
# with the mean of each variable for each activity and each subject and save as DatasetwithMeans.csv

        id_vars = c( "activity", "subject")
        measure_vars = setdiff(colnames(tidyMergedData), id_vars)
        melted_data <- melt(tidyMergedData, id=id_vars, measure.vars=measure_vars)
        
        result <- dcast(melted_data, subject + activity ~ variable, mean)    
        
        write.table(result, paste0( result_folder, "/", "DatasetwithMeans.csv"), sep = ",", row.names = FALSE)
        
        print("Done")
