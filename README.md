# Getting and Cleaning Data Course - Project

## Assumptions
* Assume the ZIP file already being downloaded and place into a folder called "UCI_HAR_Dataset" in the work directory. 

## Step 1. Merges the training and the test sets to create one data set.
* Define the folder path.
* Load all training and testing data.
* Merge the Test and Train Dataset, assign the colnames from features.txt into the new variable "allData".

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Extract the mean and standard deviation using GREP function and assign the data into new data table "allData_mean_sd".

## Step 3. Uses descriptive activity names to name the activities in the data set.
* Combine all the labels in Train and Test Dataset and rename the column as "Activity".

## Step 4. Appropriately labels the data set with descriptive variable names.
* Combine all the subject in Train and Test Dataset and rename the column as "Subject".
* Combine Data, Activity and Subject into 1 dataset named "allData".
* Rename the labels with descriptive names.
  * remove all the "-" in the Mean and Standard Deviation columns.
  * remove all the "-()" in all the columns.

## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Group the dataset with the column of Subject and Activity, then find the mean value for column 1 until column 66 (each column represent a variable).
* Write the tidy_data_set into a text file "tidy.txt" in the work directory.
