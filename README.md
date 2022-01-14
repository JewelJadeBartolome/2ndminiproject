**2nd Mini Project: Getting and Cleaning Data**

The activity uses the data set about Human Activity Recognition Using Smartphones. The data includes were collected from the accelerometers from the 
Samsung Galaxy S smartphone. The full description of the dataset can be accessed from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
________________________________________________________________________________________
**Tasks:** 
Create an R script called run_analysis.R. The script should include the following:

      • Merges the training and the test sets to create one data set.

      • Extracts only the measurements on the mean and standard deviation for each measurement

      • Uses descriptive activity names to name the activities in the dataset

      • Appropriately labels the data set with descriptive variable names

      • From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

________________________________________________________________________________________
**Solutions**

      1.Download the zip file; then, extract the files and save to a directory named "specdata". 
      2.Open R, and set the working directory to the location of the files. From the library, access the data.table and dplyr functions; these are essential functions for getting and cleaning data. 
      3.Using the read.table function, open all necessary txt files and bind them according to their set of data, save the new dataset to new variables. For this activity, all training info and test info were combined respectively. 
      4.Then, merges the training and the test sets to create one data set using the bind_rows function. 
      5.To extract the mean and standard deviation values for each measurement, use the grepl function to match the keywords 'mean' and 'standard deviation' to the names included in the data set. Bind the specified columns and store in a new variable. 
      6.Access the activity_labels.txt file using the read.table function to apply the descriptive activity names to name the activities in the dataset. Using the col.names function will allow users to change column names in the dataset. 
      7.To appropriately label the data set with descriptive variable names, utilize the merge function to 'merge' the dataset according to their respective labels. 
      8.To create an independent tidy data, a thread of functions must be established for simpler codes. Arrange the subject_id and label in the dataset and remove the label column. Save the clean data to a new variable. 
      9.In a new variable with another set of functions, access the clean data set and arrange according to subject_id and activity. Then, use the summarise_all function to summarise the data set. 
      10.The last step is to print the edited data set. The visuals of the table is clean and well organized as compared to the raw data from the unzipped file. Save and export the new data. 

______________________________________________________________________________________

Getting and Cleaning data are valuable knowledge a researcher and programmer must have especially when dealing with large and raw data sets. It makes organizing data much easier if one familiarizes with these codes and functions.

Access the full code in the run_analysis.R file! Thank you~

