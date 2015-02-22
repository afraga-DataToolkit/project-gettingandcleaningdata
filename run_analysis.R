#==================================
# Name: run_analysis.R
# Author: Alejandro Fraga
#
# =================================

library(dplyr)

features_header<- function () {
        # Set Working Directory
        setwd("C:/Users/fragaa1/Documents/R-Scripts/Getting_Cleaning_Data/class_project")

        # Read features data - 561 variable names
        feature_names<-read.table("features.txt")

        # Clean the names
        valid_feature_names <- make.names(names=feature_names[[2]],unique=TRUE,allow_=TRUE)
        
        # Assign to Global Environment so it could be used
        assign("valid_feature_names",valid_feature_names,envir = .GlobalEnv)        
                
}

get_test_data <- function () {
 
        # Gather "Test" Data
        directory<-"C:/Users/fragaa1/Documents/R-Scripts/Getting_Cleaning_Data/class_project/test"
        filedir  =paste(directory,"X_test", sep="/")
        filename =paste(filedir,"txt", sep=".")
        #Read the monitor data
        data<-read.table(filename)
        #Convert to data frame using dplyr
        x_test_data <-tbl_df(data)
                
        # Append the "test" label and create features_test 
        features_test<-paste("test", valid_feature_names, sep="-")
        
        #Add Headers        
        names(x_test_data)<-features_test

        #Select the Mean
        subset_mean <-select (x_test_data, matches("mean()",ignore.case=TRUE))        
        subset_std <-select (x_test_data, matches("std()",ignore.case=TRUE))
        
        #Add ID columns to facilitate the merge
        subset_mean <-mutate (subset_mean, ID=1:2947)
        subset_std <-mutate (subset_std, ID=1:2947)
        
        #Combine into one
        x_test_subset <- merge(subset_mean, subset_std, by="ID")
        
        #Assign to global variable x_test_data
        assign("x_test_subset",x_test_subset,envir = .GlobalEnv)
        
}

get_train_data <-function () {
        
        # Gather "Train" Data
        directory<-"C:/Users/fragaa1/Documents/R-Scripts/Getting_Cleaning_Data/class_project/train"
        filedir  =paste(directory,"X_train", sep="/")
        filename =paste(filedir,"txt", sep=".")
        #Read the monitor data
        data<-read.table(filename)
        #Convert to data frame using dplyr
        x_train_data <-tbl_df(data)                      
        
        # Append the "test" label and create features_test 
        features_test<-paste("train", valid_feature_names, sep="-")        
        
        #Add Headers        
        names(x_train_data)<-features_test
        
        #Select the Mean
        subset_mean <-select (x_train_data, matches("mean()",ignore.case=TRUE))        
        subset_std <-select (x_train_data, matches("std()",ignore.case=TRUE))
        
        #Add ID columns to facilitate the merge
        subset_mean <-mutate (subset_mean, ID=1:7352)
        subset_std <-mutate (subset_std, ID=1:7352)
        
        #Combine into one
        x_train_subset <- merge(subset_mean, subset_std, by="ID")
        
        #Assign to global variable x_train_data
        assign("x_train_subset",x_train_subset,envir = .GlobalEnv)       
        
}

merge_data<- function() {
        # This function will combine both data sets (test+train) into a single one
        # Select only the values that provide information for the mean and the standard deviation 
        x_mean_std_data<-merge(x_train_subset,x_test_subset, by="ID")
                                   
        #Assign to global variable x_all
        assign("x_mean_std_data",x_mean_std_data,envir = .GlobalEnv)         
        
}

run_analysis<-function() {
        # This function will grab the name of the columns from features.txt file
        print("Gathering Variable Names from features.txt")
        features_header()
        # This function will grab all the measurements from X_test.txt
        print("Gathering X_test data, and subsetting mean and std variables...")
        get_test_data()
        # This function will grab all the measurements from X_train.txt
        print("Gathering X_train data, and subsetting mean and std variables...")
        get_train_data()
        # Finally this function will create a consolidated data frame from test+train data for the mean and std variables
        print("Merging into a single data frame")
        merge_data()
                
}
