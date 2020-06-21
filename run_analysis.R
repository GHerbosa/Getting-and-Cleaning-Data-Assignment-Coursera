#The following codes are prerequisites before starting the 5 objectives of this assignment.

#Automatic download of the data and save to a specific folder name GnCDataAssign
#which stands for "Getting and Cleaning Data Assignment. Downloaded zip file is named
#"assign3data" and the contents will be extracted. After the file has been download,
#it will be unzipped to a folder named "assign3data"

if(!file.exists("./GnCDataAssign")) {
	dir.create("./GnCDataAssign")
}

f_Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(f_Url,destfile="./GncDataAssign/assign3data.zip")

unzip(zipfile="./GnCDataAssign/assign3data.zip",exdir="./assign3data")


#Below codes will show summary of files contained in downloaded data.

file_path <- file.path("./assign3data" , "UCI HAR Dataset")
files <- list.files(file_path, recursive=TRUE)
files


#Specifying each set of data contained in files in variables to be used in succeeding codes.
#Properties of each variables were checked to have a rough idea on what the data looks like.

activitytest_data <- read.table(file.path(file_path, "test" , "Y_test.txt" ),header = FALSE)
activitytrain_data <- read.table(file.path(file_path, "train", "Y_train.txt"),header = FALSE)
subjecttrain_data <- read.table(file.path(file_path, "train", "subject_train.txt"),header = FALSE)
subjecttest_data <- read.table(file.path(file_path, "test" , "subject_test.txt"),header = FALSE)
featuretest_data <- read.table(file.path(file_path, "test" , "X_test.txt" ),header = FALSE)
featuretrain_data <- read.table(file.path(file_path, "train", "X_train.txt"),header = FALSE)
str(activitytest_data)
str(activitytrain_data)
str(subjecttrain_data)
str(subjecttest_data)
str(featuretest_data)
str(featuretrain_data)


#OBJECTIVE 1: Merges the training and the test sets to create one data set.

# Combining data rows of training and test.

subject_data <- rbind(subjecttrain_data, subjecttest_data)
activity_data <- rbind(activitytrain_data, activitytest_data)
features_data <- rbind(featuretrain_data, featuretest_data)


#Assigning names to the variables defined above.

names(subject_data) <- c("Subject")
names(activity_data)<- c("Activity")
features_dataname <- read.table(file.path(file_path, "features.txt"),head=FALSE)
names(features_data) <- features_dataname$V2


#Finally, columns will be combined for the three topics (subject,activity,features)

SubjectnActivity <- cbind(subject_data, activity_data)
CombinedData <- cbind(features_data, SubjectnActivity)


#OBJECTIVE 2: Extracts only the measurements on the mean and standard deviation for each measurement.

#Mean and Standard Deviation

features_namessub <- features_dataname$V2[grep("mean\\(\\)|std\\(\\)", features_dataname$V2)]


# Data will now be subset depending on selected features names.

names_selected <- c(as.character(features_namessub), "Subject", "Activity" )
CombinedData <- subset(CombinedData, select=names_selected)

str(CombinedData)


#OBJECTIVE 3: Uses descriptive activity names to name the activities in the data set.

#activity_labels.txt, another file in the downloaded data will be read.

activitylabels <- read.table(file.path(file_path, "activity_labels.txt"),header = FALSE)
CombinedData$Activity <- factor(CombinedData$Activity, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))
head(CombinedData$Activity,30)


#OBJECTIVE 4: Appropriately labels the data set with descriptive variable names.

names(CombinedData) <- gsub("^t", "Time", names(CombinedData))
names(CombinedData) <- gsub("^f", "frequency", names(CombinedData))
names(CombinedData) <- gsub("Acc", "Accelerometer", names(CombinedData))
names(CombinedData) <- gsub("Gyro", "Gyroscope", names(CombinedData))
names(CombinedData) <- gsub("Mag", "Magnitude", names(CombinedData))
names(CombinedData) <- gsub("BodyBody", "Body", names(CombinedData))

names(CombinedData)

#OBJECTIVE 5: Create a second, independent tidy data set with the average of each variable 
#for each activity and each subject.

tidydata <- aggregate(. ~Subject + Activity, CombinedData, mean)
tidydata <- tidydata[order(tidydata$Subject,tidydata$Activity),]
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)