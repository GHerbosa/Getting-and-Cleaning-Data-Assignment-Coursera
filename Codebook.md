Raw Data Description:

activity - types of activity being recorded; WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING
subject - identification of the ones being tested

Code is divided into 6 sections for a neat and understandable code.

Prerequisite: Purpose is to download, unzip, and transfer the downloaded data to a working folder.
GnCDataAssign - foldername used to saved the zip file from source.
assign3data - zip file from source will be renamed to this, also, this is a created folder where the
data from the zip file will be extracted.

6 variables contains the data from the text files.
activitytest_data
activitytrain_data
subjecttrain_data
subjecttest_data
featuretest_data
featuretrain_data

Objective 1: Merge and compile data from text files.
subject_data - compilation of subject
activity_data - compilation of activity
features_data
CombinedData - a single compiled dataset from the textfiles and will be used in the succeeding codes:

Objective 2: Extracts only the measurements on the mean and standard deviation for each measurement.
features_namessub - contains the values for mean and standard deviation which will be paired with the "CombinedData"

Objective 3: Uses descriptive activity names to name the activities in the data set.
activitylabels - used to describe activities as either walking, walking upstairs, walking downstairs, sitting, standing, or laying)
CombinedData$Activity - subset of CombinedData for Activity

Objective 4: Appropriately labels the data set with descriptive variable names.

Several name function was used for this
names(CombinedData)

Objective 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata.txt text file contains the tidy data.
