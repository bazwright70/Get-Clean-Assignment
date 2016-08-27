# scriptc to download the original raw dataset

# url for the original dataset

  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download and unzip file
  
  download.file(url,"dataset.zip")
  unzip("./dataset.zip")
  
# rename folder to data for use with run_analysis script
  file.rename("UCI HAR Dataset","data")


