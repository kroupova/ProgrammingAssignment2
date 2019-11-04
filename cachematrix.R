## Put comments here that give an overall description of what your
## functions do

## The <<- operator assigns a value to an object in an environment different from the current environment

## Following the example provided in the exercise
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the mean
## 4. get the value of the mean

## Same principle will be apply to build the following function,
## which will create a matrix object that can cache its inverse:

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse 
    getinverse <- function() inv
    list(set = set, get = get, 
         setinverse = setinverse,
         getinverse = getinverse)
    
}


## As done for the previous function, another function will be built to compute the inverse of the matrix
## returned by makeCacheMatrix

## If the inverse has already been calculated (and the matrix has not changed), then the 
## function created (will call it cachesolve) should retrieve the inverse from the cache:

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)){
            message("getting cached data")
            return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}

