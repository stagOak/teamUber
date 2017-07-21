transDial7 <- function(fileName) {
        
        # read in .csv
        dF <- read.csv(fileName)
        dF$Data_Source = "other-Dial7_B00887.csv"
        
        # create the empty data frame according to data dictionary revision 
        # in use
        dataDictRevision = 3
        dFNew <- getEmptyDf(dataDictRevision)
        str(dFNew)
        
        # populate the empty data frame with data from .csv
        theSize = dim(dF)
        dFNew[1:theSize[1],1] = dF$Data_Source
        dFNew[1:theSize[1],2] = "Dial7"
        dFNew[1:theSize[1],3] = substr("other-Dial7_B00887.csv", 13, 18)
        dFNew[1:theSize[1],4] = ymd(as.character(dF$Date))
        dFNew[1:theSize[1],5] = as.character(dF$Time)
        temp <- paste(as.character(dF$Date), as.character(dF$Time))
        dFNew[1:theSize[1],6] = ymd_hm(temp, tz = "America/New_York")
        dFNew[1:theSize[1],7] = NA
        dFNew[1:theSize[1],8] = NA
        dFNew[1:theSize[1],9] = NA
        
        # load and parse address
        streetAddressTemp <- paste(trimws(as.character(dF$Address)), 
                      trimws(as.character(dF$Street)))
        library(tools)
        dFNew[1:theSize[1],10] <- toupper(streetAddressTemp)
        dFNew[1:theSize[1],11] <- toupper(trimws(as.character(dF$PuFrom)))
        
        # clean address up - separate out the named locations and store in 
        # Full_Address_2
        index1 <- dFNew$Street_Address == " " & dFNew$City != "" & 
                nchar(dFNew$City) <= 3
        dFNew$Full_Address_2[index1] <- dFNew$City[index1]
        dFNew$Street_Address[index1] <- NA
        dFNew$City[index1] <- NA
        
        index2 <- dFNew$Street_Address == " " | dFNew$Street_Address == ""
        dFNew$Street_Address[index2] <- NA#as.character(NA)
        
        index3 <- dFNew$City == " " | dFNew$City == ""
        dFNew$City[index3] <- NA#as.character(NA)
        
        
        # finish up
        dFNew[1:theSize[1],12] = NA
        dFNew[1:theSize[1],13] = NA
        dFNew[1:theSize[1],14] = NA
        dFNew[1:theSize[1],16] = NA
        
        # # check things out
        # unique(dFNew$Full_Address_2)
        # unique(dFNew$City)
        
        return(dFNew)
        
        }
