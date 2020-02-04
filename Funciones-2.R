set.seed(1014)
df <- data.frame(replicate(6, sample(c(1:10, -99), 6, rep = TRUE)))
names(df) <- letters[1:6]
df


fix_missing <- function(x){
  x[x == -99] <- NA
  x
}


missing_fixer <- function(na_value) {
  function(x) {
    x[x == na_value] <- NA
    x
  }
}


missing_fixer_2 <- function(x, na_value) {
    x[x == na_value] <- NA
    x
}

summary <- function(x){
  c(mean(x, na.rm = T),
    median(x, na.rm = T),
    sd(x, na.rm = T),
    mad(x,na.rm = T),
    IQR(x,na.rm = T))
}

summary <- function(x){
  funs <- c(mean, median, sd, mad, IQR)
  lapply(funs, function(f) f(x, na.rm = T))
}




check_p <- function(x) {
  return(if (x > 0) {
    1
  })
}

check_p2 <- function(x) {
  return(if (x > 0) 1)
}

  
check_p3 <- function(x) {
  if (x > 0) 1
}


check_p4 <- function(x) {
  ifelse(x>0, 1, 0) 
}

x <- c(6:-4)
sqrt(x)  #- gives warning
sqrt(ifelse(x >= 0, x, NA))  # no warning



