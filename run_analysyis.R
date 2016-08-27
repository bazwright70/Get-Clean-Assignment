#load required lubraries

  library(dplyr)
  library(readr)

# read in test data into tbl_df's
  
  subjecttest <- read_table("./data/test/subject_test.txt", col_names = FALSE)
  xtest <- read_table("./data/test/x_test.txt", col_names = FALSE)
  ytest <- read_table("./data/test/y_test.txt", col_names = FALSE)

# read in training data into tibbles
  
  subjecttrain <- read_table("./data/train/subject_train.txt",col_names = FALSE)
  xtrain <- read_table("./data/train/x_train.txt", col_names = FALSE)
  ytrain <- read_table("./data/train/y_train.txt",col_names =FALSE)
  activity <- read_table("./data/activity_labels.txt",col_names =FALSE)
  
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
  
# repalce acvity code with discriptive names    
  
  z <- inner_join(y ,activity , by=NULL) %>% select(activity)
  
# join 3 datasets to form wide single dataset, group and summarise 
  
  completewide <- bind_cols(subject, z, xsubset) %>%
    group_by(subject ,activity ) %>% 
    summarise_each(funs(mean))
  
##### Optional script section #####  

# write completewide table to file
  
  write_csv(completewide,"./data/completewide.csv")

# remove object when no longer needed
    
 remove(list = c("activity", "subject", "subjecttest", "subjecttrain","x", "xsubset",    
                  "xtest", "xtrain", "y", "ytest", "ytrain","z"))
  