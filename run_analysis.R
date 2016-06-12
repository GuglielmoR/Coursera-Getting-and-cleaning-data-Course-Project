# RUN_ANALYSIS.R

#Coursera-Getting and cleaning data- Course assignment.
#I load the datasets for the assignment. 
#Merges the training and the test sets to create one data set.
#I merge the x (data), y (label) and subject datasets. 

subject_test<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/test/y_test.txt")
subject_train<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/train/y_train.txt")

Xdata<-rbind(X_train,X_test)
Ydata<-rbind(y_train,y_test)
subjectdata<-rbind(subject_train,subject_test)
View(Xdata)
View(Ydata)
View(subjectdata)

features<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/features.txt")
View(features)
activity<-read.table("C:/Users/guglielmo/Desktop/DATA SCIENCE/DC WORKING DIRECTORY/UCI HAR Dataset/activity_labels.txt")
View(activity)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
# I extract the names with mean (mean) and Standard deviations (std) and I rename with them the columns of the dataset.
names_mean_std<-grep("(mean|std)", features$V2 ,value=TRUE)   
Xdata <- Xdata[, 1:79]
names(Xdata)<-names_mean_std
colnames(Xdata)

#Uses descriptive activity names to name the activities in the data set
# Now I give the correct name to the activities. MOreover, I rename the columns for the activities and subjects.
Ydata[, 1]<-activity[Ydata[, 1],2]

#Appropriately labels the data set with descriptive variable names. 

names(Ydata)<-"activity_labels"
names(subjectdata)<-"subject"

#I merge the three datasets

FULLDATASET<-cbind( Ydata, subjectdata, Xdata)
View(FULLDATASET)

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
TIDYDATASET<- ddply(FULLDATASET, .(subject, activity_labels), colwise(mean))
write.table(TIDYDATASET, file = "tidy_dataset.txt", row.name=FALSE)
                    
