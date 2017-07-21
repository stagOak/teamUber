# clear workspace
rm(list = ls())

# load the libraries
library(lubridate)
library(dplyr)

# source the functions
source("sourceTheFunctions.R")
sourceTheFunctions()

# main

# get the paths
# set work directory location directory = paths[[1]]
# set data location 1 - For Hire Car Service Data = paths[[2]]
# set data location 2 - fullDataSet = paths[[3]]
# set data location 3 - samples of full dataSet = paths[[4]]
paths <- getPathSEM()

# get the raw data frame using path to data directory
path2Data <- paths[[2]]
allDataSets <- transformAll(path2Data) # see commented code below for ... call

# save allDataSets to R data frame (.Rda)
saveDFPathAndFileName = paste(paths[[3]], "\\", "dataSet_072017.Rda", sep = "")
save(allDataSets, file = saveDFPathAndFileName)

# pull a sample from full data set and save to .csv
sampleSize = 5e5 # set sample size
fileName <- getSampleFileName(sampleSize)
sample <- sampSaveCSV(allDataSets, sampleSize, paths[[4]], fileName) 
        
# # get the raw data frame when working in the data directory
# setwd(paths[[2]]) # set working directory to data directory
# allInWD <- transformAll()
# setwd(paths[[1]]) # set working directory to working directory