experimentA <- function(){
  roll <- sample(1:6, size = 4, replace = TRUE)
  condition <- sum(roll == 6) > 0
  return(condition)
}

experimentB <- function(){
  first.die <- sample(1:6, size = 24, replace = TRUE)
  second.die <- sample(1:6, size = 24, replace = TRUE)
  condition <- sum((first.die == second.die) & (first.die == 6)) > 0
  return(condition)
}

happensA <- replicate(100, experimentA())
fr.A <- sum(happensA)/length(happensA)
Pr.A <- 671/1296

happensB <- replicate(100, experimentB())
fr.B <- sum(happensB)/length(happensB) 
Pr.B <- 0.4914038761

n <- 1:length(happensA)
cum.fr.A <- cumsum(happensA)/n
plot(1:length(happensA), cum.fr.A, type = "l", xlab = "n", ylab = "Relative frequency A")
abline(h = 671/1296, col = 'red', lty = 2)

n <- 1:length(happensB)
cum.fr.B <- cumsum(happensB)/n
plot(1:length(happensB), cum.fr.B, type = "l")
abline(h = 0.4914038761, col = 'red')

plot(1:length(happensA), cum.fr.A, type = "l", col = 'blue', xlab = "n", ylab = "Relative frequency")
lines(1:length(happensB), cum.fr.B, type = "l", col = 'green')
abline(h = 671/1296, col = 'red')
abline(h = 0.4914038761, col = 'orange')
