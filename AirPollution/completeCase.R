complete <- function(directory, id=1){
    frame <- data.frame(id = numeric(0), nobs = numeric(0))
    
    for(monitor in id){
        path <- paste(paste(getwd(), directory, sprintf("%03d", monitor),sep = "/"), "csv", sep = ".")
        monitor_data <-read.csv(path)
        
        sulf_na <-is.na(monitor_data$sulfate)
        data <- monitor_data[(!sulf_na),]
        
        nitr_na <-is.na(data$nitrate)
        data <- data[(!nitr_na),]
        
        nob <- nrow(data)
        frame <- rbind(frame, data.frame(id = monitor, nobs= nob))
    }
    frame
}