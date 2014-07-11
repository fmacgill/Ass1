## run_analysis.R
## 
## Determine Row and Column Names

## Load Data into memory
## create a table data table with appropiate column names from 3 files
loadData <- function (type) {
    folder <- "UCI HAR Dataset/"
    
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

mergeData <- function(){
    train <- loadData("train")
    test <- loadData("test")
    dat <- rbind(train,test)
    dat
}