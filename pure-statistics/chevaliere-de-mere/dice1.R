n <- 100

## defining the experiment
roll <- sample(x = 1:6, size = n*4, replace = TRUE)
mat.rolls <- matrix(roll, ncol = 4, nrow = n, byrow = TRUE)
## one row, one outcome of the i-th experiment

## check whether there is a 6 or not
event.found <- function(x){
  k <- x
  return (k == 6)
}

event.A <- apply(mat.rolls, 1, event.found)

cum.fr.A <- cumsum(event.A)/(1:length(event.A))
plot(1:length(event.A), cum.fr.A, type = 'l')




## relative freq. of getting a 6
fr.A.6 <- sum(roll == 6)/n
c(1/6, fr.A.6)

## the relative freq. approaching the probability
fr.A.6 <- cumsum(roll == 6)/(1:n)
plot(1:n, fr.A.6, type = 'l')
abline(h = 1/6, col = 'red')

