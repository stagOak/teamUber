# clear workspace
rm(list = ls())

# libraries
library(lubridate)

source("getEmptyDf.R")
source("getPathSEM.R")
source("transformAll.R")
source("transAmerican.R")

# main

# get the paths to working directory and the data directory
paths <- getPathSEM()

# get the raw data frame using path to data directory
path2Data <- paths[[2]]
allDataSets <- transformAll(path2Data) # see commented code below for ... call

# # get the raw data frame when working in the data directory
# setwd(paths[[2]]) # set working directory to data directory
# allInWD <- transformAll()
# setwd(paths[[1]]) # set working directory to working directory