# Coursera - Getting and Cleaning Data - Course Project

# 1 Merging the training and the test sets to create one data set

# Read the "features" and "activity" datasets
activityLabel <- read.table("activity_labels.txt", col.names = c("activity_id", "activity"))
features <- read.table("features.txt", col.names = c("feature_id","feature"))
feature_names <- as.character(features[,2])

# Read the "Test files"

# Read the subject id for obsrevations in Test files
subject_test <- read.table("./test/subject_test.txt", col.names = "subject_id")
# Read the activity for obsrevations in Test files
activity_test <- read.table("./test/y_test.txt", col.names = "activity_id")
# Read the features for obsrevations in Test files
features_test <- read.table("./test/X_test.txt", col.names = feature_names)

# Create the data frame with features of the observations for "Test files" 
test_features <- cbind(subject_test, activity_test, features_test)


# Read the "Train files"

# Read the subject id for obsrevations in Train files
subject_train <- read.table("./train/subject_train.txt", col.names = "subject_id")
# Read the activity for obsrevations in Train files
activity_train <- read.table("./train/y_train.txt", col.names = "activity_id")
# Read the features for obsrevations in Train files
features_train <- read.table("./train/X_train.txt", col.names = feature_names)

# Create the data frame with features of the observations for "Train files" 
train_features <- cbind(subject_train, activity_train, features_train)

# Complete dataset with the Train and Test files

complete_dataset <- rbind(test_features, train_features)

# 2 Getting only mean and standard deviation values for the observations

# Identifing the columns with only mean and standard deviation values
selected_features <- features[grepl("mean\\(\\)", features$feature) | grepl("std\\(\\)", features$feature), ]
# Dataset with only mean and standard deviation values for the observations
dataset_ms <- complete_dataset[, c(c(1, 2), selected_features$feature_id + 2) ]

# 3 Assigning Descriptive names for activity

complete_dataset2 <- merge(complete_dataset, activityLabel, by = "activity_id")

# 4 Assigning Descriptive names for the variables

n <- length(feature_names)

for (i in 1:n) {
        feature_names[i] <- gsub("^t", "Time", feature_names[i])
        feature_names[i] <- gsub("^f", "Freq", feature_names[i])
        feature_names[i] <- gsub("mean()", "Mean", feature_names[i])
        feature_names[i] <- gsub("std()", "StdDev", feature_names[i])
        feature_names[i] <- gsub("mad()", "MedAbsDev", feature_names[i])
        feature_names[i] <- gsub("max()", "Max", feature_names[i])
        feature_names[i] <- gsub("min()", "Min", feature_names[i])
        feature_names[i] <- gsub("sma()", "SigMagArea", feature_names[i])
        feature_names[i] <- gsub("energy()", "Energy", feature_names[i])
        feature_names[i] <- gsub("iqr()", "IntQuartileRange", feature_names[i])
        feature_names[i] <- gsub("entropy()", "Entropy", feature_names[i])
        feature_names[i] <- gsub("arCoeff()", "AutoRegCoeff", feature_names[i])
        feature_names[i] <- gsub("Correlation()", "Correlation", feature_names[i])
        feature_names[i] <- gsub("maxInds()", "MaxFreqIndex", feature_names[i])
        feature_names[i] <- gsub("meanFreq()", "MeanFreq", feature_names[i])
        feature_names[i] <- gsub("skewness()", "Skewness", feature_names[i])
        feature_names[i] <- gsub("kurtosis()", "Kurtosis", feature_names[i])
        feature_names[i] <- gsub("bandsEnergy()", "BandsEnergy", feature_names[i])
        feature_names[i] <- gsub("angle()", "Angle", feature_names[i])
}

# Dataset with the descriptive variable names
complete_dataset3 <- complete_dataset
colnames(complete_dataset3) <- c("subject", "activity", feature_names)


# 5 Tidy data set

# Calculate the "Mean" of the feature variables for each subject and activity
tidydata <- aggregate(complete_dataset, by = list(complete_dataset$subject_id,complete_dataset$activity_id),mean)
# Remove the repetative columns in the data set (Group.1 = activity_id, Group.2 = subject_id)
tidydata <- tidydata[, names(tidydata) != c("Group.1", "Group.2")]
# Include the activity name corresponding to the activity_id in the dataset
tidydata <- merge(activityLabel, tidydata,  by = "activity_id")
colnames(tidydata) <- c( "activity_id", "activity", "subject_id", feature_names)

# Create a new file "tidydata.txt" with the tidy data obtained
write.table(tidydata, "C:/Users/Praveen/datasciencecoursera/gettingandcleaningdata_courseproject/tidydata1.txt", row.name = F, col.name = T)
write.table(tidydata, "C:/Users/Praveen/datasciencecoursera/gettingandcleaningdata_courseproject/tidydata2.txt", row.name = F, col.name = F)

