Data download and unzip 

# Checking, if file does not exist, download it to working directory.

## Reading data

## Analysis
# 1. Merges the training and the test sets to create one data set.

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# 4. Appropriately labels the data set with descriptive activity names.
# combines test and train of subject data and activity data, gives descriptive lables
# combines subject, activity, and mean and std only data set to create final data set.

# 3. Uses descriptive activity names to name the activities in the data set
# groups the activity column of dataSet, renames lable of levels with activity_levels, and apply it to dataSet.

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# Finally writes the tidy data to the working directory as "tidy_data.txt"