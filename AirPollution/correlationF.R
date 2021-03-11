corr <- function(directory, threshold = 0){
    cor_Result <- numeric(0)
    complete_cases <- complete(directory)
    complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
    
    if(nrow(complete_cases)>0){
        for(monitor in complete_cases$id){
            path <- paste(paste(getwd(), directory, sprintf("%03d", monitor),sep = "/"), "csv", sep = ".")
            monitor_data <- read.csv(path)
            print(path)
            print(monitor_data)
            
            sulf_na <-is.na(monitor_data$sulfate)
            data <- monitor_data[(!sulf_na), ]
            
            nitr_na <-is.na(data$nitrate)
            data <- data[(!nitr_na), ]
            
            sulf_data <- data["sulfate"]
            nitra_data <- data["nitrate"]
            cor_Result <- c(cor_Result, cor(sulf_data, nitra_data))
        }
    }
    cor_Result
    
}