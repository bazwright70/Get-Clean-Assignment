Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tacc-xyz and tGyro-xyz (not included in the final summary table). These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyacc[xyz] and tgravityacc[xyz]) using another low pass butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals (tbodyaccjerk[xyz] and tbodygyrojerk[xyz]). also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tmravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyacc[xyz], fbodyaccjerk[xyz], fbodyGyro[xyz], fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'[xyz]' is used to denote 3-axial signals in the x, y and z directions.

tbodyacc[xyz]<br>
tGravityacc[xyz]<br>
tbodyaccjerk[xyz]<br>
tbodyGyro[xyz]<br>
tbodyGyrojerk[xyz]<br>
tbodyaccMag<br>
tGravityaccMag<br>
tbodyaccjerkMag<br>
tbodyGyroMag<br>
tbodyGyrojerkMag<br>
fbodyacc[xyz]<br>
fbodyaccjerk[xyz]<br>
fbodyGyro[xyz]<br>
fbodyaccMag<br>
fbodyaccjerkMag<br>
fbodyGyroMag<br>
fbodyGyrojerkMag<br>

The set of variables that were estimated from these signals are: 

mean: Mean value <br>
std: Standard deviation<br>

The readings are taken across 6 activities for each of the 30 subjects:

Walking<br>
Walking Upstairs<br>
Walking Downstairs<br>
Sitting<br>
Standing<br>
Laying.<br>

Data Table Transformations
====================

    The readings produced in the final table 'completewide' are the mean eaverage of all the individual 
readings for each activity by each subject.

    The fianl data table 'completewide' contains both the training data and the test data merged into a single table. Of the 561 variables for the original data, only those readings for mean and standard
deviation were reatained for the final table.

Variable names have been simplified by removing any capital letters and punction to reduce possible spelling errors when making further analysis on variables the 'completewide' table.