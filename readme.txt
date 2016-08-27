
	********** Getting and Cleaning Data Assignment - ReadMe **********

	- This repository contains the data and scripts nessecary to run the assignment analysis. 
	- The raw data is contained in the 'data folder'
	- The repository contains a codebook describing the transformations, cleaning and variables in the cleaned datasets:
			1)             completewide
			2)	complete narrow
	-  Two different transformations are available to provide a 'wide' or 'narrow' view of the data.
	-  Columns variable names have been cleaned to remove capital letters and and punctuation to simplify spelling
	    to limit typing errors during further analysis. The format for sensor variable names has been kept consistent as
	    described in the code book.
	-  Each row in the 'completewide' dataset contains the mean average of individual readings from one subject performing
	   a single type of activity. Each column priovides a single sensor measurement, (not including subject and activity)
	-  Each row in the 'completenarrow' dataset contains the mean average of a individual readings from a single subject
	    performing a single type of activity for a single sensor reading.
		
	3 Scripts are included:

run_analysis.R script:
	This is the main script which takes the test and training data from the data folder and produces the single tidy dataset
	required for the assignment. The variable set is reduced to produce only readings which measure mean and standard
	deviation. Only those readings which were initially labelled as 'mean()' or 'std()' are included. Other variables such as
	meanfreq() were not included.

	The srcipt has optional code to write the table to a .csv file and/or remove all objects except the completewide table

analysis_narrow.R:
	This takes the final completewide table and converts it to a norrow format to allow the data to be viewed by sensor
	according to activity. This can only be run on the data set produced by the run_analysis script.

data_download.R script:
	This script contains code to download the original raw data from the same website as the data in the repository. The
	script downloads the file and unzips it into the same directory structure in the Git repository. 

	Required Packages:

	The packages 'dplyr' and 'readr' are required to run the 'run_analysis.R' package while the 'tidyr' package is required
	for the 'analysis_narrow.R' script. The 'data_download.R' script can be run by base R.




	

