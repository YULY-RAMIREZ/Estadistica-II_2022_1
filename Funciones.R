myfirtsfun <- function(n)
{
  n*n
}

k <- 10
m <- myfirtsfun(k)
m

##### vector
v <- c(1,3,0.2,1.5,1.7)

####definir una matrix
M <- cbind(c(0.2,0,91), c(1.0,5.1,1),c(6,0.2,1),c(2.0,9,1),deparse.level = 1, make.row.names = T)

#### Second function
mySecFun <- function(v,M)
{
 u=c(0,0,0,0) 
 for(i in 1:length(v))
 {
   u[i]=myfirtsfun(v[i]);
 }
 return(u)
}

sqv <- mySecFun(v)
sqv
