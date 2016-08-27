# load libraries required for transformation

  library(tidyr)
  library(dplyr)
  
# Transform completewide dataframe to data frame.
  
  completenarrow <- completewide %>%
    gather(signal,avgreading,-subject,-activity) %>%
    arrange(signal, subject)