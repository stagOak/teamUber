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
        
        # # start processing data files
        # ameri <- transAmerican(paste(path2File, "other-American_B01362.csv",
        #                                sep = ""))
        # 
        # carmel <- transCarmel(paste(path2File, "other-Carmel_B00256.csv",
        #                              sep = ""))
        # 
        # dial7 <- transDial7(paste(path2File, "other-Dial7_B00887.csv",
        #                             sep = ""))
        
        uber0 <- transUber(paste(path2File, "uber-raw-data-apr14.csv",
                                 sep = ""))
        uber1 <- transUber(paste(path2File, "uber-raw-data-may14.csv",
                                 sep = ""))
        uber2 <- transUber(paste(path2File, "uber-raw-data-jun14.csv",
                                 sep = ""))
        uber3 <- transUber(paste(path2File, "uber-raw-data-jul14.csv",
                                 sep = ""))
        uber4 <- transUber(paste(path2File, "uber-raw-data-aug14.csv",
                                 sep = ""))
        uber5 <- transUber(paste(path2File, "uber-raw-data-sep14.csv",
                                 sep = ""))
        lyft <- transLyft(paste(path2File, "other-Lyft_B02510.csv",
                                 sep = ""))
        
        all <- rbind(uber0, uber1, uber2, uber3, uber4, uber5, lyft)
        return(all)
        
}