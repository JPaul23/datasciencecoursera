#Collecting data
if(!file.exists("./Data")){dir.create("./Data")}
dataDescription <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataUrl, destfile = "./Data/dataset.zip", method = "curl")

#Unzip the file
print("=====Unzipping the file=====")
unzip(zipfile = "./Data/dataset.zip", exdir = "./Data")

