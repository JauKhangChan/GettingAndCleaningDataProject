# Pre-assumptions: Assume the ZIP file already being downloaded and place into a folder called "UCI_HAR_Dataset" in the work directory.

library(plyr)

# Step 1. Merges the training and the test sets to create one data set.
#define the folder path
data_filepath <- "./UCI_HAR_Dataset/"
train_filepath <- paste(data_filepath, "train/", sep="")
test_filepath <- paste(data_filepath, "test/", sep="")

#Load all training and testing data
trainData <- read.table(paste(train_filepath, "X_train", ".txt", sep=""))
trainLabel <- read.table(paste(train_filepath, "Y_train", ".txt", sep=""))
trainSubject <- read.table(paste(train_filepath, "subject_train", ".txt", sep=""))
testData <- read.table(paste(test_filepath, "X_test", ".txt", sep=""))
testLabel <- read.table(paste(test_filepath, "Y_test", ".txt", sep=""))
testSubject <- read.table(paste(test_filepath, "subject_test", ".txt", sep=""))
activityLabel <- read.table(paste(data_filepath, "activity_labels", ".txt", sep=""))
features <- read.table(paste(data_filepath, "features", ".txt", sep=""))

#Merge the Test and Train Dataset, assign the colnames from features.txt into the new "alldata".
allData <- rbind(trainData, testData)
colnames(allData) <- features$V2

# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
allData_mean_sd <- allData[grep("mean\\(\\)|std\\(\\)", features$V2)]

# Step 3. Uses descriptive activity names to name the activities in the data set
allLabels <- rbind(trainLabel, testLabel)
allLabels[,1] <- activityLabel[allLabels[,1], 2]
names(allLabels) <- "Activity"

# Step 4. Appropriately labels the data set with descriptive variable names.
allSubjects <- rbind(trainSubject, testSubject)
names(allSubjects) <- c("Subject")

#combine Data, Activity and Subject into 1 dataset
allData <- cbind(allData_mean_sd, allLabels, allSubjects)

# Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Group the dataset with the column of Subject and Activity, then find the mean value for column 1 until column 66 (each column represent a variable)
tidy_data_set <- ddply(allData, .(Subject, Activity), function(x) colMeans(x[, 1:66]))

#Write the tidy_data_set into a text file "tidy.txt" in the work directory
write.table(tidy_data_set, "tidy.txt", row.name=FALSE)
