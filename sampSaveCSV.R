sampSaveCSV <- function(dF, sampleSize, savePath, sampSaveFileName) {
        
        filePathAndName <- paste(savePath, "\\", sampSaveFileName, 
                                 sep = "")
        
        if(sampleSize == 0){
                # do not sample - save whole file
                write.csv(dF, file = filePathAndName) 
                return(NULL)
        }else{
                # sample and save file
                set.seed(42)
                dFSample <- sample_n(dF, sampleSize)
                
                dFSample <- addSomeColumns(dFSample)
                
                write.csv(dFSample, file = filePathAndName)
                return(dFSample)
        }
        
        
}

