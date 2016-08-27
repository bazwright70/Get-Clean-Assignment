# scriptc to download the original raw dataset

# url for the original dataset
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# download zipped filefrom url, create data dir if required
  if(!dir.exists("./data")){
    dir.create("./data")
  }
  download.file(url,"./data/zipdata")
  unzip("./data/zipdata")