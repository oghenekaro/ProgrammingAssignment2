## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	##makeCacheMatrix: Creates a special "matrix" object that 
		##can cache it's inverse
	inv <- NULL
	set <- function(y){
	x <<- y
	## <<- assigns a value to an object in an environment different
	## from the current environment
	inv <<- NULL
	}
		get <- function()x
		setinv <- function(inverse) inv <<- inverse
		getinv <- function()inv
	##Return a list which contains functions which will:
	## a) Set the matrix,
	## b) Get the matrix,
	## c) Set the inverse,
	## d) Get the inverse.
	list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	##output of makeCacheMatrix()
	inv <- x$getinv()
	##If the inverse has already been calculated
	##get it from the cache and skip further computation
	##else calculate the inverse
	if(!is.null(inv)){
		message("get cached data")
	return(inv)
	}
	mat.data <- x$get()
	inv <- solve(mat.data, ...)
	x$setinv(inv)
	##setinv function sets the value of the inverse in the cache
	##
	return(inv)
}

	
