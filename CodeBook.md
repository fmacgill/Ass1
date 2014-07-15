Getting and Cleaning Data Assignment
====

A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

## Study Design
Detials of how the data was collected can be found 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables

Tidy Data set.


activity is a categical variable with 6 options
1. walking
2. sitting
3. walkingupstairs
4. walkingdownstairs
5. standing
6. laying

### Variable name choices

The initial naming of column utilised prefixes (ie t,f), suffixes (X,Y,Z), camel case, brackets (), scores (-) and abreviations (ie. std, Freq)

#### prefixes  t,f 
are limited, domain typical abbreviations. 
 . Is it worth expanding them?
 . Would the usuability increased?
 
Choose to retain in present format, 2 options, commonly used in domain.  

#### sufffixes X.Y.Z 
No alternatives would improve usuablility.


### Category labels
activity is a categical variable with 6 options, lower case, merged names were choosen.
. Upper case is more difficult to type
. Camel case is human readable, but more likely to lead to spelling/typing mistakes. The benifit of readability for 1-2 word category names is limitted.


### Variables prefixes and suffixes
t - indicates time domain signals were captured at a constant rate of 50 Hz
f - indicates frequency domain signals

## Instructions
