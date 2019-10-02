# PART 1 - R WORKSHOP #
# =================== #
# Well, the first comment is that with "#" you can add comments!

# Math works in R as anywhere else
4 + 2
4 - 2
4 * 2
4 / 2
4 ^ 2
4 %/% 2      # What is that ... ?
4 %% 2

# Variable assignment
x <- 4
y <- 5 %/% 2 # What is the value of y ... ?
z <- x %% y  # Guess the value of z 
# To print the assignment use ()
(t <- x)

# Some cool things 
4 -> x       # does also work! not the usual way, though
i <- j <- 3  # what is the value of i and j ?
i <- 3 + (j <- 4)
k <- i + (j <- x) # what is the value of k ?
# Dot '.' should be treated like underscore '_' 
# This is used extensively in base R
person.age <- 20

# Not just numbers
# Basic data types in R:

# NUMERICS (i.e. floats)
n <- 2.75

# INTEGERS (<-)
i <- 2

# LOGICALS
l <- TRUE    # FALSE

# CHARACTERS
c <- "R"   

# and FACTORS, but we will see them later ...

# class()

# VECTORS ... ! c from combine
(empty <- c())
(n.vec <- c(i, n))
(l.vec <- c(TRUE, FALSE))
(c.vec <- c("R", "Python"))

# Add names()
names(c.vec)  # Ups ... !

# Income and Outcomes example 
actions <- c(100, 150, -30.78, -50.99, -132.42, 0, -12.35)
days <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")

actions
names(actions) <- days
actions

actions.1 <- actions
actions.2 <- c(50, -10.28, -5.77, -0.45, 25, 0, 0)

(actions <- actions.1 + actions.2)
sum(actions)

# Selection (R starts from 1, not from 0 !!)
actions[3]
actions[c(6,7)]
actions[(1:5)]

# Selection by comparison
actions.1 > 0
actions.1[actions.1 > 0]

# MATRIX
# that was just one week ...
(my.nums <- (1:9)) == c(1, 2, 3, 4, 5, 6, 7, 8, 9)

matrix(my.nums, byrow = TRUE, nrow = 3)






