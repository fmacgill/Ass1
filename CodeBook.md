Getting and Cleaning Data Assignment
====

A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

## Study Design
Details of how the data was collected can be found 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data features were normalized and bounded within [-1,1].  The variables do not have units. 

## Data transformation

- Merged test and training data sets
- Isolated mean and standard deviation variables ( These variable names included the string 'mean()' or 'std()' )
- Replaced / renamed activities and some variables to faciliate easier use.
- Summarized the remaining variables by subject and activity by taking the mean/average without normalization


## Variables

### Subject

subject is an identifier for each particpant 	1-30

### Renaming of activities
The study look at 6 different activities 
1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing 
6. Laying

In the original data each activity was mapped to an integer id between 1 and 6.
Human readable naming will improve the usability of the data. 
When choosing the human readable labels to use, lower, upper, and camelCase were consider.
The activity labels are short, using solely lower case trades off ease of reading and typing.

activity is a categical variable with 6 options

1. walking
2. walkingupstairs
3. walkingdownstairs
4. sitting
5. standing
6. laying

### Variable name choices

The initial naming of column utilised prefixes (ie t,f), suffixes (X,Y,Z), camel case, brackets (), scores (-) and abreviations (ie. std, Freq)

For long variable names camelCase provides superior readablity, and  with an IDE are easy to work with. The renaming process, replaced lower case characters after a score with an upper case character, removed braces and scores, and replace 'Mag' was replace with 'Magnitude'. Where the string 'Body' was duplicated only one was maintained.

There were a large number of abbreviations. Replacement of each abbreviations with a more descriptive string was considered. Maintaining the original naming style for the majority of case, means my intreptation of the experiment will not confuse future users. 

Note : Some abbreviations are domain specific; jerk,t,f. 


#### Variables prefixes and suffixes
### prefixes  t,f 

prefixes  t,f  are limited, domain typical abbreviations. 


- t - indicates time domain signals were captured at a constant rate of 50 Hz
- f - indicates frequency domain signals

Choose to retain in present format, 2 options, commonly used in domain.  

#### sufffixes X.Y.Z 
No alternatives would improve usuablility.

### Variables Names
- subject 
- activity
- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccStdX
- tGravityAccStdY
- tGravityAccStdZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkStdX
- tBodyAccJerkStdY
- tBodyAccJerkStdZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroStdX
- tBodyGyroStdY
- tBodyGyroStdZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkStdX
- tBodyGyroJerkStdY
- tBodyGyroJerkStdZ
- tBodyAccMagnitudeMean
- tBodyAccMagnitudeStd
- tGravityAccMagnitudeMean
- tGravityAccMagnitudeStd
- tBodyAccJerkMagnitudeMean
- tBodyAccJerkMagnitudeStd
- tBodyGyroMagnitudeMean
- tBodyGyroMagnitudeStd
- tBodyGyroJerkMagnitudeMean
- tBodyGyroJerkMagnitudeStd
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccStdX
- fBodyAccStdY
- fBodyAccStdZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkStdX
- fBodyAccJerkStdY
- fBodyAccJerkStdZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroStdX
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyAccMagnitudeMean
- fBodyAccMagnitudeStd
- fBodyAccJerkMagnitudeMean
- fBodyAccJerkMagnitudeStd
- fBodyGyroMagnitudeMean
- fBodyGyroMagnitudeStd
- fBodyGyroJerkMagnitudeMean
- fBodyGyroJerkMagnitudeStd





