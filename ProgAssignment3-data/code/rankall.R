rankall <- function(outcome, num = "best"){
        #Read the data
        data <- read.csv("outcome-of-care-measures.csv",
                         colClasses = "character")
        dt <- as.data.frame(cbind(data[, 2], #Heart rate
                                  data[, 7], #State
                                  data[, 11], #Heart attack
                                  data[, 17], #Heart failure
                                  data[, 23]), #pneumonia
                            stringsAsFactors = FALSE)
        
        colnames(dt) <- c("hospital", "state", "heart attack","heart failure","pneumonia")
        
        #check outcome and state validity
        if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
                stop('Invalid outcome!')
        }
        else if (is.numeric(num)){
                by_state <- with(dt, split(dt, state))
                ordered <- list()
                for (i in seq_along(by_state)){
                        
                        by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)], 
                                                             by_state[[i]][, "hospital"]), ]
                        ordered[[i]]  <- c(by_state[[i]][num, "hospital"], by_state[[i]][, "state"][1])
                }
                results <- do.call(rbind, ordered)
                out <- as.data.frame(results, row.names = results[, 2], stringsAsFactors = FALSE)
                names(out) <- c("hospital", "state")
        }
        else if(!is.numeric(num)){
                
                if(num == "best"){
                        by_state <- with(dt, split(state))
                        ordered <- list()
                        for (i in seq_along(by_state)) {
                                by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)], 
                                                                     by_state[[i]][, "hospital"]), ]
                                ordered[[i]]  <- c(by_state[[i]][1, c("hospital", "state")])
                        }
                        results <- do.call(rbind, ordered)
                        out <- as.data.frame(results, stringsAsFactors = FALSE)
                        rownames(out) <- out[, 2]
                }
                else if(num == "worst"){
                        by_state <- with(dt, split(dt, state))
                        ordered <- list()
                        for(i in seq_along(by_state)){
                                by_state[[i]] <- by_state[[i]][order(by_state[[i]][, eval(outcome)], 
                                                                     by_state[[i]][, "hospital"], 
                                                                     decreasing = TRUE), ]
                                ordered[[i]]  <- c(by_state[[i]][1, c("hospital", "state")])
                        }
                        results <- do.call(rbind, ordered)
                        out <- as.data.frame(results, stringsAsFactors = FALSE)
                        rownames(out) <- out[, 2]
                }
                else{
                        stop('Invalid num')
                }
        }
        return(out)
}