# project-gettingandcleaningdata
This Repo is created to hold the programming assignment of the Coursera- Getting and Cleaning Data class

This file will explain how the scripts work and how are they releated:

Name:           features_header()

Description: This function will read features.txt file, creating a character vector with the names after sanitizing
to make them unique

Output: A character vector saved to a global variable

________________________________________________

Name:           get_test_data()

Description: This function will read X_test.txt file and create a data frame. Then it will read the featurenames vector and append a label to each of them to identify the test variables. Then I subset only the mean and std variables and create a consolidated data frame from the test data. 

Output: A data frame with the test data including only mean and std variables.

________________________________________________
Name:           get_train_data

Description: This function will read X_train.txt file and create a data frame. Then it will read the featurenames vector and append a label to each of them to identify the train variables. Then I subset only the mean and std variables and create a consolidated data frame from the train data. 

Output: A data frame with the train data including only mean and std variables.

________________________________________________
Name:           merge_data()

Description: This function merges on a single data frame both train and test data frames that include only mean and std dev measurments. 

Output: A data frame with the consolidated data.


________________________________________________
Name:           run_analyis()

Description: This function combines all the 3 functions to get on a single run. It also clean up other variables used for calculation 

Output: A data frame with the consolidated data.
