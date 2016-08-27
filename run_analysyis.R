#load required lubraries
  library(dplyr)


# read in test data into tbl_df's
  
  subjecttest <- tbl_df(read.table("./data/test/subject_test.txt"))
  xtest <- tbl_df(read.table("./data/test/x_test.txt"))
  ytest <- tbl_df(read.table("./data/test/y_test.txt"))

# read in training data into tibbles
  
  subjecttrain <- tbl_df(read.table("./data/train/subject_train.txt"))
  xtrain <- tbl_df(read.table("./data/train/x_train.txt"))
  ytrain <- tbl_df(read.table("./data/train/y_train.txt"))
  activity <- tbl_df(read.table("./data/activity_labels.txt",stringsAsFactors = FALSE))
  
# merge test with training datasets
  
  subject <- bind_rows(subjecttest, subjecttrain, id = NULL)
  x <- bind_rows(xtrain,xtest, id = NULL)
  y <- bind_rows(ytrain,ytest, id = NULL)
  
  # name columns
  
  names(subject) <- c("subject") 
  names(y) <- c("act")
  names(x)<- scan("./data/features.txt",what = "character", sep ="\n",quiet = TRUE)
  names(activity) <- c("act","activity" )
  
# produce subset only containing mean and standard deviation readings
  
  xsubset <- select(x, contains("mean()"),contains("std()"))
  
# strip prefix and removes caps and delimiters from subset column names
  
  names(xsubset) <- sapply(strsplit( tolower( names( xsubset)),split = " "),function(x) {x[[2]]})
  names(xsubset) <-  gsub("[()|-]","",names(xsubset))
  
# replce acvity code with discriptive name    
  
  z <- inner_join(y ,activity , by=NULL) %>% select(activity)
  
# join 3 datasets to form wide single dataset, group and summarise 
  
  acceldata <- bind_cols(subject, z, xsubset) %>%
    group_by(subject ,activity ) %>% 
    summarise_each(funs(mean))

#write completewide table to file
  
  write.table(completewide, file = "completewide.csv")
  