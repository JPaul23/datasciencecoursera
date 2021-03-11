makeCacheMatrix <- function(x = matrix()){
    Inv <- NULL
    set <- function(y){
        x <<- y
        Inv <<- NULL
    }
    #Get the value of a matrix
    get <- function() x
    #set the value of inverse
    setInverse <- function(inverse) (Inv <<- inverse)
    #get the value of inverse
    getInverse <- function(){Inv}
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

cacheSolve <- function(x,...){
    Inv <- x$getInverse()
    
    #Check if the inverse has been calculated
    if(!is.null(Inv)){
        message("Getting cached data")
        return(Inv)
    }
    matx <- x$get()
    #calculate the inverse of matrix using solve
    Inv <- solve(matx, ...)
    x$setInverse(Inv)
    Inv
}