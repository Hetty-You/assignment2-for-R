## Matrix inversion is usually a costly computation and there may be benefit to caching the inverse of a matrix rather than compute it repeatedly. Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.

## The first function, makeCacheMatrix creates a special "matrix", which is really a matrix containing a function to: set the value of matrix, get the value of the matrix, set the matrix of the inverse, get the matrix of the inverse


makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(inverse) m <<- inverse
  getsolve<- function() m
  matrix(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## The following function calculates the inverse of the special "matrix" created with the above function. However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setsolve function.

cacheSolve <- function(x, ...) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
## Return a matrix that is the inverse of 'x'
}



