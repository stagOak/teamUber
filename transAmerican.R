transAmerican <- function(fileName) {
        
        # read in .csv
        american <- read.csv(fileName)
        american$Data_Source = "other-American_B01362.csv"

        # clean the data
        # investigate columns X, X.1 and X.2 - they only have NA's in them
        # get rid of these three columns
        xUnique = unique(american$X)
        x1Unique = unique(american$X.1)
        x2Unique = unique(american$X.2)
        if((length(xUnique) == 1 & is.na(xUnique)) & 
           (length(x1Unique) == 1 & is.na(x1Unique)) &
           (length(x2Unique) == 1 & is.na(x2Unique)) ) {
                keeps <- c("DATE", "TIME", "PICK.UP.ADDRESS", "Data_Source")
                american <- american[keeps]
        }else{
                print("Something has changed about columns 4, 5 and 6")
                stop()
        }
        
        # create the empty data frame according to data dictionary revision 
        # in use
        dataDictRevision = 3
        ameri <- getEmptyDf(dataDictRevision)
        str(ameri)
        
        # populate the empty data frame with data from .csv
        theSize = dim(american)
        ameri[1:theSize[1],1] = american$Data_Source
        ameri[1:theSize[1],2] = "American"
        ameri[1:theSize[1],3] = substr("other-American_B01362.csv", 16, 21)
        ameri[1:theSize[1],4] = mdy(as.character(american$DATE))
        ameri[1:theSize[1],5] = as.character(american$TIME)
        temp <- paste(as.character(american$DATE), as.character(american$TIME))
        ameri[1:theSize[1],6] = mdy_hms(temp, tz = "America/New_York")
        ameri[1:theSize[1],7] = NA
        ameri[1:theSize[1],8] = NA
        ameri[1:theSize[1],9] = NA
        temp <- as.character(american$PICK.UP.ADDRESS)
        temp <- strsplit(temp, ",")
        ameri[1:theSize[1],10] = trimws(temp[[1]][1])
        ameri[1:theSize[1],11] = trimws(temp[[1]][2])
        ameri[1:theSize[1],12] = NA
        ameri[1:theSize[1],13] = NA
        ameri[1:theSize[1],14] = NA
        ameri[1:theSize[1],15] = NA
        ameri[1:theSize[1],16] = NA
        
        return(ameri)
        
}