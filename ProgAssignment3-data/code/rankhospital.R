rankhospital <- function(state, outcome, rank = "best"){
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
        if(!state %in% dt[, 'state']){
                stop('Invalid state !')
        } 
        else if(!outcome %in% c("heart attack","heart failure","pneumonia")){
                stop('Invalid outcome!')
        
        }
        else if (is.numeric(rank)) {
                st <- which(dt[, "state"] == state) 
                sd <- dt[st, ] #data from the state
                sd[,eval(outcome)] <- as.numeric(sd[, eval(outcome)])
                sd <- sd[order(sd[,eval(outcome)], sd[,"hospital"]),]
                out <-sd[, "hospital"][rank]
        }
        else if(!is.numeric(rank)){
                if (rank == "best"){
                        out <- best(state, outcome)
                }
                else if (rank == "worst"){
                        st <- which(dt[, "state"] == state)
                        sd <- dt[st, ]
                        sd[, eval(outcome)] <- as.numeric(sd[, eval(outcome)])
                        sd <- sd[order(sd[, eval(outcome)], sd[, "hospital"], decreasing = TRUE),]
                        out <- sd[, "hospital"][1]
                }
                else{
                        stop('Invalid rank!')
                        
                }
                
        }
        return(out)
}