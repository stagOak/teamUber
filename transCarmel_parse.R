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
        

        
        # browser()
        
        
        
        # develop code on temp data frame
        # dFTemp <- dFNew
        
        
        
        
        # parse PU_Adress
        library(tools)
        pUAddress <- strsplit(toupper(as.character(dF$PU_Adress)), ",")
        
        # get anything after a coma in pUAddress into a list, if no coma then
        # populate list with NA
        func1 <- function(x) {
                trimX2 <- trimws(x[2])
                if(length(x) == 2 & nchar(trimX2) < 4) {
                        #print(x[2])
                        if(trimX2 == "") {
                                return(as.character(NA))
                        }else{
                                return(trimX2)
                        }
                }else{
                        return(as.character(NA))
                }
        }
        pUAddressStrSplit_2 <- lapply(pUAddress, func1)
        
        # identify states
        listOfStates <- as.array(c("CT", "NY", "NY.", "NJ", "PA", "MA", "MD", 
                                   "NH", "DC", "RI", "DE"))
        temp1 <- sapply(pUAddressStrSplit_2, grepl, x = listOfStates)
        temp1 <- t(temp1)
        
         # identfy Cities
        listOfCities <- as.array(c("BK", "QU", "Q", "QNS", "BX", "SI"))
        temp2 <- sapply(pUAddressStrSplit_2, grepl, x = listOfCities)
        temp2 <- t(temp2)
        
        # identify unknowns or "no field in data dictionary"
        listOfUnknowns <- as.array(c("LI", "N", "B", "L", "P"))
        temp3 <- sapply(pUAddressStrSplit_2, grepl, x = listOfUnknowns)
        temp3 <- t(temp3)
        
        
        browser()
        
        
        # check work
        sumRowsTemp3 <- rowSums(temp3, na.rm = TRUE)
        unique(sumRowsTemp3)
        
        index2s <- sumRowsTemp3 == 2
        
        temp3Check[index2s, dim(temp3)[2]] <- temp3[index2s, dim(temp3)[2]]
        
        
        
        unique(unlist(pUAddressStrSplit_2))
        

        
        
        
        
        
        
        
        
        
        
        dFNew[1:theSize[1],10] = NA
        dFNew[1:theSize[1],11] = NA
        
        dFNew[1:theSize[1],12] = NA
        dFNew[1:theSize[1],13] = NA
        dFNew[1:theSize[1],14] = NA
        dFNew[1:theSize[1],15] = NA
        dFNew[1:theSize[1],16] = NA
        
        return(dFNew)
        
}