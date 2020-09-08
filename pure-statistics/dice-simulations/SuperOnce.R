premios <- read.csv2("superonce_premios.csv", row = 1)
# Pregunta 1
prob.super.once <- function(t, k){
  return (choose(t, k)*choose(80 - t, 20 - k)/choose(80, 20))
}
# Pregunta 2 (Hypergeometrica)
esp.super.once <- function(t){
  return ((20*t)/80)
}
# Pregunta 3
esp.premio <- function(t){
  suma <- 0
  it <- 12-t
  for (i in it:12){
    y <- premios[i, it]
    suma <- suma + (y*prob.super.once(t, 12-i))
  }
  return (round(suma, 4))
}
# Pregunta 4
esp.premio.cuad <- function(t){
  suma <- 0
  it <- 12-t
  for (i in it:12){
    y <- premios[i, it]
    suma <- suma + ((y*y)*prob.super.once(t, 12-i))
  }
  return (round(suma, 4))
}

var.premio <- function(t){
  variance <- esp.premio.cuad(t) - (esp.premio(t)*esp.premio(t))
  return (round(variance, 4))
}
