# Getting-and-Cleaning-Data-Assignment-Coursera

Main objective of this code is to check the knowledge of the user about the general topics covered in Coursera Course Getting and Cleaning Data.

Information about RAW DATA from its source link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Code Overview:
From raw data, task is to convert raw data to a tidy data which can be processed or analyze further much easily. Code is divided to
6 subsections, 5 of which is based on objectives given by the assignment and the other 1 (first) is a prerequisite before working on the data itself.
Prerequisite: it involves downloading the raw data directly from its source. Internet is a must in this activity. Data will be saved as a zipfile and will be extracted to a new folder that will be the main working folder. text files are also saved in variables that will be used later.
Objective 1: From different text files, the purpose of this code was to compile and summarize similar data from different text files.
Objective 2: Extracts the mean and standard deviation values from the compiled data.
Objeective 3: Sets a convenient names for the values in activity data to easily understand.
Objective 4: Continuation of setting names, it involves transforming shortcut description to a descriptive and understandable one.
Objective 5: Create the tidy data in a separate text file.

