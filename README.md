getdata-005Project
==================

This repository is for the Getting and Cleaning Data project and contains:

      1. ReadMe.md file that contains info on this project
      
      2. CodeBook.md file that contains a description of the variables
      
      3. run_analysis.R that reads and cleans the data set (description below)

The run_analysis.R description:
      
      1. Create a "data" folder in your current directory if one does not exist
      
      2. Download the file package to this folder
      
      3. Next I read in each component and store it as a variable
      
      4. Then I combine the 3 test and train data sets into 3 large sets using rbind
      
      5. These were given labels
      
            * The X Data was labeled with the features.txt file
            
            * The Y Data was labeled as Activity
            
            * The subject data as Subject
            
            * The Activity labels were given "ID" and "Act Label"
            
      6. Using cbind these were then made into a large data set
      
      7. Using merge, I took the large data set and merged the Activity label based on 1-6 ID
      
            * The Data set currently goes X Data (561 columns), Subject, Activity by label instead of ID