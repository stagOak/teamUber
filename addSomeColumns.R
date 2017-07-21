addSomeColumns <- function(dF){
        
        head(dF)
        dF$date <- as.Date(dF$Date.Time)
        tempHour <- as.numeric(format(dF$Date.Time, "%H"))
        tempMin <- as.numeric(format(dF$Date.Time, "%M"))
        dF$timeDec <- tempHour + tempMin/60
        
        return(dF)
        
}