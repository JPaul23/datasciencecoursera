#Loading package
library(dplyr)

ref_path <- file.path("./Data", "UCI HAR Dataset")
if (file.exists(ref_path)){
        print("====> Path found")
} else {
        print("Path not found!")
}
files <- list.files(ref_path, recursive = TRUE)

#Load & Read Features data
feature_data <- read.table(file.path(ref_path, "features.txt" ), 
                           col.names = c("n", "functions"),header = FALSE)

#activity labels data
activity_data <- read.table(file.path(ref_path, "activity_labels.txt"),
                            col.names = c("code", "activity"),header = FALSE)

#Read train data
x_train <- read.table(file.path(ref_path, "train", "X_train.txt"),
                      col.names = feature_data$functions,header = FALSE)
y_train <- read.table(file.path(ref_path, "train", "y_train.txt"),header = FALSE)
subject_train <- read.table(file.path(ref_path, "train", "subject_train.txt"),header = FALSE)

#Read test data
x_test <- read.table(file.path(ref_path, "test", "X_test.txt"),
                     col.names = feature_data$functions, header = FALSE)
y_test <- read.table(file.path(ref_path, "test", "y_test.txt"),header = FALSE)
subject_test <- read.table(file.path(ref_path, "test", "subject_test.txt") ,header = FALSE)


#Merging data(test, train, subject)
data_x <- rbind(x_train, x_test)
data_y <- rbind(y_train, y_test)
names(data_y)<-c("activity")
data_subject <- rbind(subject_train, subject_test)
names(data_subject)<-c("subject")

Data_Merged <- cbind(data_subject, data_y, data_x)


#Extracts only the measurements on the mean and standard deviation for each measurement.
Data <- Data_Merged %>% select(subject, activity, contains("mean"), contains("std"))

#Name the activities in the data set using descriptive activity name
Data$activity <- activity_data[Data$activity, 2]

#labeling the data set with descriptive variable names
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))

#Creating the second data, independent tidy data
# with the average of each variable for each activity and each subject
Data_second<-aggregate(. ~subject + activity, Data, mean)
Data_second<-Data_second[order(Data_second$subject,Data_second$activity),]

#Exporting the data
write.table(Data_second, "./tidy_dataset.txt", row.names = FALSE, quote = FALSE)

print("All GOOD!")