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
matrix(my.nums, byrow = FALSE, nrow = 3)

# Now let's aggregate
actions.week1 <- c(100, 150, -30.78, -50.99, -132.42, 0, -12.35)
actions.week2 <- c(-50.43, 100, -0.75, -32.45, -12.68, 100, 50)
actions.week3 <- c(100, 50, -99.99, -45.67, -24.50, -0.68, 0)

actions.vec <- c(actions.week1, actions.week2, actions.week3)

actions.mat <- matrix(actions.vec, byrow = TRUE, nrow = 3)
# Now rownames and colnames
colnames(actions.mat) <- days
rownames(actions.mat) <- c("week1", "week2", "week3")
actions.mat

# rowSums and colSums
rowSums(actions.mat)
colSums(actions.mat)

# Add column --> cbind()
# Add row --> rbind()

ghostday <- c(0, 0, 0)
cbind(actions.mat, ghostday)

# Selection
(mat <- matrix(my.nums, byrow = TRUE, nrow = 3))

mat[1,2]
mat[3,3]
mat[2:3, 1:3]
mat[,1]
mat[1,]
mat[,]     # What is that ... ?
mat[-2,]   # What is that ... ?
mat[-2,-2]

## EXERCISE 5 MIN ##
## ============== ##
set.seed(777)
data <- matrix(runif(10000, 0, 10), 100, 100) # Do not run this twice without running seed before
data # Huge? Still that's not big data :)

# Challenge 1: Find the maximum value the whole matrix. Hint: use max()
max(data)

# Challenge 2: Find the mean value of the whole matrix. Hint: use mean()
mean(data)

# Challenge 3: select the first row and subtract it the last column, and compute the sum of the resulting vector.
# Hint: no hint this time, sorry
sum(data[,100] - data[1,])

# Challenge 4: select the entries which are equal or greater than five
data[data >= 5]
 
# Challenge 5: determine whether there are more entries >= 5 than < 5. Please return a Logical value.
# Hint: use length() to count the number of entries
length(data[data >= 5]) > length(data[data < 5])










