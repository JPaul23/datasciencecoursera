pollutantmean <- function(directory,pollutant,id = 1:332){
 
  vec <- c()

  for(monitor in id){
    path <- paste(paste(getwd(), directory, sprintf("%03d", monitor),sep = "/"), "csv", sep = ".")
    monitor_data <- read.csv(path)
    data <- monitor_data[pollutant]
    vec <- c(vec, data[!is.na(data)])
  }

mean(vec)

}

