transCarmel <- function(fileName) {
        
        # read in .csv
        dF <- read.csv(fileName)
        dF$Data_Source = "other-Carmel_B00256.csv"
        
        # create the empty data frame according to data dictionary revision 
        # in use
        dataDictRevision = 3
        dFNew <- getEmptyDf(dataDictRevision)
        str(dFNew)
        
        # populate the empty data frame with data from .csv
        theSize = dim(dF)
        dFNew[1:theSize[1],1] = dF$Data_Source
        dFNew[1:theSize[1],2] = "Carmel"
        dFNew[1:theSize[1],3] = as.character(dF$Base_No)
        dFNew[1:theSize[1],4] = mdy(as.character(dF$Date))
        dFNew[1:theSize[1],5] = as.character(dF$Time)
        temp <- paste(as.character(dF$Date), as.character(dF$Time))
        dFNew[1:theSize[1],6] = mdy_hm(temp, tz = "America/New_York")
        dFNew[1:theSize[1],7] = NA
        dFNew[1:theSize[1],8] = NA
        dFNew[1:theSize[1],9] = NA
        dFNew[1:theSize[1],10] = NA
        dFNew[1:theSize[1],11] = NA
        dFNew[1:theSize[1],12] = NA
        dFNew[1:theSize[1],13] = NA
        dFNew[1:theSize[1],14] = as.character(dF$PU_Adress)
        dFNew[1:theSize[1],15] = NA
        dFNew[1:theSize[1],16] = NA
        
        return(dFNew)
        
}