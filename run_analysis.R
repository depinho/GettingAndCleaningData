#Course 3 - Peer Graded Assignment

library(dplyr)
library(qdapTools)

# Download dataset files from provided URL for local processing

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
impfile <- "Course3_Assignment.zip"
if(!file.exists(impfile)) 
{
    download.file(fileURL, destfile = impfile, method = "curl")
    unzip(impfile, junkpaths = TRUE) #Unzip all files, with no subdirectories, into current working directory
}

#Import activity labels and feature names into R

actlabels <- read.table("activity_labels.txt")
actlabels <- rename(actlabels, ActivityID = V1, ActivityName= V2) #TD: human readable variable names

featlabels <- read.table("features.txt", header = FALSE)
featlabels <- rename(featlabels, FeatureID = V1, FeatureName = V2)  #TD: human readable variable names


# Import test dataset into R

testsubID <- read.table("subject_test.txt")
testsubID <- rename(testsubID, SubjectID = V1)  #TD: human readable variable names

testactID <- read.table("y_test.txt")
testactID <- rename(testactID, ActivityID = V1) #TD: human readable variable names

testdata <- read.table("X_test.txt") 
names(testdata) <- featlabels$FeatureName   #feature names assigned to respective column

CompleteTestSet <- data.frame(matrix(ncol = ncol(testdata) + 2 , nrow = nrow(testsubID))) #Create data frame 
CompleteTestSet <- cbind(testsubID,testactID,testdata)  #   with dimensions to bind test data files together

# Import train dataset into R

TrainSubID <- read.table("subject_train.txt")
TrainSubID <- rename(TrainSubID, SubjectID = V1)  #TD: human readable variable names

TrainActID <- read.table("y_train.txt")
TrainActID <- rename(TrainActID, ActivityID = V1) #TD: human readable variable names

TrainData <- read.table("X_train.txt") 
names(TrainData) <- featlabels$FeatureName   #feature names assigned to respective column

CompleteTrainSet <- data.frame(matrix(ncol = ncol(TrainData) + 2 , nrow = nrow(TrainSubID)))
CompleteTrainSet <- cbind(TrainSubID,TrainActID,TrainData)

OneDataSet1 <- rbind(CompleteTestSet, CompleteTrainSet)  # Meets requirement 1

MeanStdColumns <- grep("*mean|std*",names(OneDataSet1))  #Extract only mean and std for each measurement
OneDataSet2 <- cbind(OneDataSet1[,1:2],OneDataSet1[,MeanStdColumns])  #Meets requirement 2

OneDataSet2$ActivityID <- lookup(OneDataSet2$ActivityID,actlabels) #Replaces ID with Activity Name
OneDataSet3 <- rename(OneDataSet2, ActivityName = ActivityID)   #Meets requirement 3


OneDataSet4 <- OneDataSet3
names(OneDataSet4) <- tolower(names(OneDataSet4)) #TD: variable names should be all lower case where possible
names(OneDataSet4) <- gsub("[-()]","",names(OneDataSet4))   #TD: replace chars -,) and ( with no space
names(OneDataSet4) <- gsub("^t","time",names(OneDataSet4))  #TD: descriptive, replace t with time
names(OneDataSet4) <- gsub("^f","freq",names(OneDataSet4))  #TD: descriptive, replace f with freq
                                                            #Meets requirement 4   

OneDataSet5 <- group_by(OneDataSet4,subjectid,activityname) 
TidyDataSet <- summarise_each(OneDataSet5,funs(mean(.)))    #TD: one observ per row, one variable per col
                                                            #Meets requirement 5

expfile <- "TidyDataSet.txt"
write.table(TidyDataSet,expfile)    #Create txt file with tidy data set

write.table(names(TidyDataSet),"VariableNames.txt", quote = FALSE)  #Create txt file with variable names
                                                                    # for Codebook.md table