## The two functions below would work together to allow user to set a matrix as input that needs to be inversed and stored in cache.
## The second function allows user to retrieve the inverse from cache or calculate the cache and store it back in cache.

## This function would allow user to set the matrix that needs to be inversed and cached

makeCacheMatrix <- function(x = matrix()) {

	m <- NULL
	set <- function(y){
      	x<<- y
        m<<-NULL
	    }
	      
	get <- function()x
	setinverse <- function(inv) m <<- inv
	getinverse <- function() m
	Tlist(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function retrieves the inverse of the matrix by calling first function.
## Before running this function, it is assumed that the makeCacheMatrix has been instantiated using mkcacheobj <- makeCacheMatrix()

cacheSolve <- function(x, ...) {

	## makecacheobj is created by instantiating makeCacheMatrix function which is how it is being referred in this function
	m <- mkcacheobj$getinverse()
  	if(!is.null(m)){
      		message("getting cached data")
          	return(m)
	      
	        }
	data <- mkcacheobj$get()

	## Calculating the inverse of matrix if not present in cache
	m <- solve(data, ...)
	
	## Storing the inverse by calling an instance of first object
	mkcacheobj$setinverse(m)

	## returning the inverse
	m


	## Return a matrix that is the inverse of 'x'

}
