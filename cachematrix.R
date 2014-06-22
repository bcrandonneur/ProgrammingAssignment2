## These functions together let the user compute and cache the inverse of a
##   square matrix. To use them first use makeCacheMatrix to create a
##   CachedMatrix object and then call cacheSolveMatrix to first create and
##   then retrieve the cached inverse of the matrix.

## makeCacheMatrix: create a CacheMatrix object that stores a matrix
##   along with it's inverse
##
##     inputs: x -- optional square matrix to store
##     interface: set() sets the matrix to the given input
##                get() returns the matrix
##                setsolve() stores the provided matrix as the inverse
##                getsolve() returns the stored matrix inverse
########################################################################
makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
        setsolve = setsolve,
        getsolve = getsolve)
}


## cacheSolve: a function to create and access the cached inverse of a matrix.
##   The first time cacheSolve is called, it will compute the inverse of
##   the matrix in the CacheMatrix object provided. Subsequent calls using the
##   same CacheMatrix object will return the cached inverse instead of
##   calculating the value from scratch.
##
##     inputs: x - a CacheMatrix object create with makeCacheMatrix
##     outputs: the inverse of the matrix x
########################################################################
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    s <- x$getsolve()
    if (!is.null(s)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}
