getPathSEM <- function() {
        pathList <- list()
        # set work directory location directory
        wDPath1 <- "C:\\Users\\steveMorin\\Documents\\fromOtherComp_051117_1731\\"
        wDPath2 <- "mSAnalytics\\summerProject2017\\teamUber"
        wDPath <- paste(wDPath1, wDPath2, sep = "")
        pathList[[1]] <- wDPath
        setwd(wDPath)
        getwd()
        
        # set data location 1 - For Hire Car Service Data
        dataPath1 <- "C:\\Users\\steveMorin\\Documents\\fromOtherComp_051117_1731"
        dataPath2 <- "\\mSAnalytics\\summerProject2017\\originalDataSet\\"
        dataPath3 <- "uber-pickups-in-new-york-city"
        dataPath <- paste(dataPath1, dataPath2, dataPath3, sep = "")
        pathList[[2]] <- dataPath
        
        # set data location 2 - fullDataSet
        dataPath1 <- "C:\\Users\\steveMorin\\Documents\\fromOtherComp_051117_1731"
        dataPath2 <- "\\mSAnalytics\\summerProject2017\\teamUber\\dataSets"
        dataPath <- paste(dataPath1, dataPath2, sep = "")
        pathList[[3]] <- dataPath
        
        # set data location 3 - samples of full dataSet
        dataPath1 <- "C:\\Users\\steveMorin\\Documents\\fromOtherComp_051117_1731"
        dataPath2 <- "\\mSAnalytics\\summerProject2017\\teamUber\\dataSets\\samples"
        dataPath <- paste(dataPath1, dataPath2, sep = "")
        pathList[[4]] <- dataPath
        
        return(pathList)
}