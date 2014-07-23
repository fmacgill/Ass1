## run_analysis.R
library(doBy)

folder <- "UCI HAR Dataset/"

## Load Data into memory
## create a table data table with appropiate column names from 3 files
loadData <- function (type) {
    
    # filenames
    subjectFilename <- paste(folder,type, "/" , "subject_", type, ".txt",sep="")
    xFilename <- paste(folder,type, "/" , "X_", type, ".txt",sep="")
    yFilename <- paste(folder,type, "/" , "Y_", type, ".txt",sep="")
    
    # read files
    subjects <- read.table(subjectFilename) # Subject id
    x <- read.table(xFilename) # data
    y <- read.table(yFilename) # activity id
    
    # set and read colnames
    colnames(subjects) <- "subject"
    colnames(y) <- "activity"
    
    featuresFilename <- paste(folder,"features.txt",sep="")
    features <-read.table(featuresFilename)
    colnames(x) <- features[,2]
    
    dat <- cbind(subjects,y,x)
    dat
}

##
## Returns data.frame with only the Mean and Standard Deviation columns
## That is only columns containing mean 'mean()' and standard deviation 'std()' variables
## 
## Input data frame
## Output data.frame with only columns containing mean and standard deviation variables

trimToMeanStdColumns <- function ( dat) {

    cols <- colnames(dat)
    # do not want meanFreq column 
    icol <- grep("mean\\(\\)|std\\(\\)",cols,perl=TRUE)
    icol <- append(c(1,2),icol)
    
    trimmed <- dat[,icol]
    trimmed
}

## Replaces the activity id in the data.frame with activity names
##
## Input data.frame where activity column contains integer
## Output data.frame where the activity column contain a self describing factor 
#      with 6 levels
factorizeActivity <- function ( dat) {

    activityFilename <- paste(folder, "activity_labels", ".txt",sep="")
    activities <- read.table(activityFilename) # Activity
    activities$V2 <- tolower(activities$V2)
    activities$V2 <- sub("_","",activities$V2)
    dat$activity <- factor(dat$activity,levels=activities[,1],labels=activities[,2])
    dat
}

## Converts column names to desired format
## 
## format is CamelCase with alphanumeric characters. 
## '-' indicates the next character should  be converted to upper case
## '-', '(', and ')'  characters are removed
##
## Seperated into own function to assist testing
##
## Input : array of strings
## Output : array of strings
cleanColumnNames <- function (cols){

    result <- gsub("(-[a-z])","\\U\\1",cols,perl=TRUE)
    result <- gsub("-","",result)
    result <- gsub("\\(","",result)
    result <- gsub("\\)","",result)
    
    # According to feature.txt several column names are incorrect because the 
    # word Body is repeated. Repeats Removed.
    result <- gsub("BodyBody","Body",result)
    
    # Mag does not automatically imply magnitude so change
    result <- sub("Mag","Magnitude",result)
       
    result       
}


renameVariables <- function (dat) {
    cols <- colnames(dat)

    colnames(dat) <- cleanColumnNames(cols)
    dat
}

run_analysis <- function(){
    train <- loadData("train")
    test <- loadData("test")
    dat <- rbind(train,test)
    
    dat <- trimToMeanStdColumns(dat)
    dat <- factorizeActivity(dat)
    dat <- renameVariables(dat)
    
    # summarize to create tidy data 
    # in doBy package
    dat <- summaryBy(. ~subject+activity, data=dat,FUN=list(mean), keep.names=TRUE)
    dat
}
    
