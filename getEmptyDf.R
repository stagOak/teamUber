getEmptyDf <- function(dataDictRev) {
        # set up data frame to meet data dictionary specification
        # current revision = currRev
        currRev = 3
        # dataDictRev = an integer representing th revision level desired
        if(dataDictRev != currRev) {
                print(paste("getEmptyDf at Data Dictionary Rev = ", currRev,
                            ". You have requested Rev = ", dataDictRev))
                stop()
        }
        dataDictDf <- data.frame("Data_Source" = character(0), 
                                 "Car_Service" = character(0),
                                 "Base" = character(0),
                                 "Date" = as.Date(character(0)),
                                 "Time" = character(0),
                                 "Date/Time" = as.POSIXct(character(0), 
                                                          tz = "America/New_York"),
                                 "LocationID" = integer(0),
                                 "Latitude" = numeric(0),
                                 "Longitude" = numeric(0),
                                 "Street_Address" = character(0),
                                 "City" = character(0),
                                 "State" = character(0),
                                 "Zip_Code" = integer(0),
                                 "Full_Address" = character(0),
                                 "Full_Address_2" = character(0),
                                 "AirportFlag" = logical(0),
                                 stringsAsFactors = FALSE)
        return(dataDictDf)
}