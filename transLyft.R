transLyft <- function(fileName) {
        
        # get file name out of path
        if(length(grep("[\\\\]", fileName)) == 0){
                print(fileName)
        }else{
                temp <- strsplit(fileName, "[\\\\]")
                tempFileName = temp[[1]][10]
                print(tempFileName)
        }
        
        # read in .csv
        dF <- read.csv(fileName)
        dF$Data_Source = tempFileName
        
        # create the empty data frame according to data dictionary revision 
        # in use
        dataDictRevision = 3
        dFNew <- getEmptyDf(dataDictRevision)
        # str(dFNew)
        
        # populate the empty data frame with data from .csv
        theSize = dim(dF)
        dFNew[1:theSize[1],1] = dF$Data_Source
        dFNew[1:theSize[1],2] = "Lyft"
        dFNew[1:theSize[1],3] = "B02510" # from file name
        dFNew[1:theSize[1],4] = NA
        dFNew[1:theSize[1],5] = NA
        dFNew[1:theSize[1],6] = mdy_hm(as.character(dF$time_of_trip), tz = 
                                                "America/New_York")
        dFNew[1:theSize[1],7] = NA
        dFNew[1:theSize[1],8] = dF$start_lat
        dFNew[1:theSize[1],9] = dF$start_lng
        dFNew[1:theSize[1],10] = NA
        dFNew[1:theSize[1],11] = NA
        dFNew[1:theSize[1],12] = NA
        dFNew[1:theSize[1],13] = NA
        dFNew[1:theSize[1],14] = NA
        dFNew[1:theSize[1],15] = NA
        dFNew[1:theSize[1],16] = NA
        
        return(dFNew)
        
}

