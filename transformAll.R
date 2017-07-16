transformAll <- function(...) {
        
        # accomadate working in a directory other then the data directory
        # path to data directory is passed in as required in ...
        args <- list(...)
        
        if(length(args) != 0) {
                # print("args is not empty")
                # print(args)
                path2File <- paste(args[[1]], "\\", sep = "")
        }else{
                # print("args is empty")
                # print(getwd())
                path2File <- ""
        }
        
        # start processing data files
        ameri <- transAmerican(paste(path2File, "other-American_B01362.csv",
                                       sep = ""))
        
        all <- rbind(ameri)
        return(all)
        
}