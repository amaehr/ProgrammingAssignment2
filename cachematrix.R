## In this second programming assignment R functions are written that are able to to cache potentially time-consuming 
## computations.The first function creates a special "matrix" object that can cache its inverse.The second function
## computes the inverse of the special "matrix" returned by the first function. If the inverse has already been calculated
## (and the matrix has not changed), then the second function should retrieve the inverse from the cache.

## This cunction creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list (set=get, 
        get=get, 
        setinverse=setinverse,
        getinverse=getinverse)
}


## This function computes the inverse of the special "matrix" returned by the makeCachMatrix function and checks if the
## inverse has already been calculated. If so the function should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if (!is.null(m)){
    message("fetching cache data")
    return(m)
  }
  data <- x$get()
  m <- solce(data,...)
  x$setinverse(m)
  m
}
