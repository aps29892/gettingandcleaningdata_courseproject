GETTING AND CLEANING DATA - COURSE PROJECT
====================================

The data used in the project represents data obtained from "Human Activity Recognition" Experiment using Smartphones.

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## For each record it is provided

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Operations on this Data Set

### Operation 1: Merge the training and the test sets to create one data set
Steps Involved:

1. Read the data files containing the "activity" and "features" variables

2. For each "test" and "train" files, read & merge the "subject_id", "activity_id" and the "features" variables for the observations

3. Merge the datasets of "test" and "train" files to form a "complete dataset containing the variables for all the observations in the experiment

### Operation 2: Get only mean and standard deviation values for the observations
Steps Involved:

1. Identify the column names with only mean and standard deviation values

2. Get the dataset from the complete dataset with only mean and standard deviation variables for the observations

### Operation 3: Assigning Descriptive names for activity
Steps Involved:

1. Merge the activity names with the complete dataset to include the descriptive names of activity

### Operation 4: Assigning Descriptive names for the variables
Steps Involved:

1. Re write the names of the features with their descriptive names

2. Assign these updated descriptive feature names to the column names for the complete datasets

### Operation 5: Creating the "Tiny" dataset
Steps Involved:

1. Calculate the "Mean" of the feature variables for each subject and activity using the aggregate command

2. Remove the repetative columns in the data set (Group.1 = activity_id, Group.2 = subject_id)

3. Include the activity name corresponding to the activity_id in the dataset

4. Create a new file "tidydata.txt" with the tidy data obtained
