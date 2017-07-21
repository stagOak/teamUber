getSampleFileName <- function(sampleSize){
        
        # construct sample .csv file name
        temp <- Sys.time()
        temp1 <- format(temp, "%H%M%S")
        temp2 <- format(temp, "%m%d%Y")
        temp3 <- as.character(sampleSize)
        fileName = paste("sample_", temp2, "_", temp1, "_", temp3, ".csv", 
                         sep = "")
        return(fileName)
}