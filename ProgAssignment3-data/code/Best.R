best <- function(state, outcome){
        data <- read.csv("outcome-of-care-measures.csv",
                         colClasses = 'character',header = TRUE)
        dt <- as.data.frame(cbind(data[, 2], #Heart rate
                                  data[, 7], #State
                                  data[, 11], #Heart attack
                                  data[, 17], #Heart failure
                                  data[, 23]), #pneumonia
                            stringsAsFactors = FALSE)
        
        colnames(dt) <- c("hospital", "state", "heart attack","heart failure","pneumonia")
        
        #check outcome and state validity
        if(!state %in% dt[, 'state']){
                stop('Invalid state !')
        } 
        else if(!outcome %in% c("heart attack","heart failure","pneumonia")){
                stop('Invalid outcome!')
        } 
        else {
                st <- which(dt[, "state"] == state) 
                sd <- dt[st, ] #data from the state
                os <- as.numeric(sd[, eval(outcome)])
                
                val_min <- min(os, na.rm = TRUE)
                results <- sd[, "hospital"][which(os == val_min)]
                out <- results[order(results)]
                
        }
        return(out)
        
}