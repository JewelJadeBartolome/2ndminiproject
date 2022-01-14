#CMSC 197 (Introduction to Data Science)
#1st Semester AY 2021-2022
#SECOND MINI-PROJECT

#JEWEL JADE BARTOLOME 
#BS STATISTICS III

        #Access the data.table function and the dplyr function.
      
              library (data.table)
              library (dplyr)
            
        #set the working directory to the local file where the UCI HAR Dataset exist. 
      
              setwd ("C:/Users/customer/2ndminiproject/UCI HAR Dataset/UCI HAR Dataset")
              
              
                    ##1##
                            #Using the bind_cols function, combine by columns the txt files storing the data for Subject_train,
                            #Y_train and X_train through the read.table function. Store the files to the variable info_train. 
                                
                                    info_train <- bind_cols(read.table("train/subject_train.txt"), 
                                                         read.table("train/y_train.txt"), 
                                                         read.table("train/X_train.txt"))
                                  
                            #Do the same for the data subject_test, y_test, and x_test. 
                            #Bind these by columns and store to the  variable info_test.
                            
                                    info_test <- bind_cols(data.table(read.table("./test/subject_test.txt"), 
                                                            read.table("./test/y_test.txt"),
                                                            read.table("./test/X_test.txt")))
                        
                            #To merge the training and test data, use the bind_rows function to combine 
                            #info_train and info_test. Store the new data to the variable info. 
                                  
                                    info <- bind_rows(info_train, info_test)
                  
                            #Access the feature.txt file and set all characters to lowercase using the tolower function.
                            #Select specifically v2 which includes the subjectid and label of the data; store into features.
                                  
                                    features <- tolower(read.table('features.txt')$V2)
                                  
                            #Set the column names for info to subjectid and label taken from the variable features. 
                                  
                                    colnames(info) <- c("subjectid", "label", features)
                            
                    ##2##
                          
                            #Extracts only the measurements on the mean and standard deviation for each measurement.
                            #Using the bind_cols function, create a table that extracts only the mean and SD of each measurement.
                            #Store the data to msd_values; the information will be extracted from the info table.
                            #The grepl function is used to match the pattern (mean and SD) in the dataset---
                            #to specify the values to be included in the new variable. 
                                
                                    msd_values <- bind_cols(info[1:2], info[, grepl("mean\\(|std\\(", names(info))])
                    
                    ##3##
                          
                            #Access the activity_labels.txt through the read.table function, and set the column names to label and activity.
                            #Store the data to the variable labels. 
                                
                                    labels <- read.table('activity_labels.txt', col.names = c("label", "activity"))
                               
                    ##4##
                            #Appropriately labels the data set with descriptive variable names
                            #Merge the data from labels and info by label; store it in the updated info variable.
                                
                                    info <- merge(labels, info, by = 'label')
                          
                    ##5##
                            #Create a second, independent tidy data set with the average of each variable for each activity and each subject.
                            #In a thread of functions, access the "info" data, 
                            #then using the arrange function, organize the data according to subjectid and label.
                            #Then using the select function, delete the label.Store into the tidy_info.
                                
                                    tidy_info <- info %>% 
                                                arrange(subjectid, label) %>% 
                                                select(-label)
                          
                            #Use the tidy_info variable as basis for the thread of functions.
                            #Group according to subjectid and activity the data using the group_by function.
                            #Summarise all data using the summarise_all function.
                            #The print function will present the arrange and clean data store in the final_info function 
                          
                        
                                    final_info <- tidy_info %>% 
                                                 group_by(subjectid, activity) %>%
                                                 summarise_all(list(mean = mean))%>%
                                                 print
                          
          
