# PART 2 - R WORKSHOP #
# =================== #

# Control flow --> CONDITIONALS
FALSE == FALSE
TRUE != FALSE
10 %/% 6 <= 15 %% 3
"R" >= "Python"     # Wait, what?

# Comparison of vectors
x <- c(15, 20, -30)
y <- c(2, 22, -30)

x > y
x <= y

# AND &, OR |, NOT !
!!!(!(x < 10) & !(y > 0)) | (x + y > 0)  

# If conditions like in C++ :)
my.age <- # your age
if (my.age >= 18) {
  print("you are legally adult, but just legally")
}

# Let's add an else statement
if (my.age >= 18) {
  print("You are legally adult, but just legally")
} else {
  print("I cannot help you")
} 

# You can customize your control flow with "else if"
how.many.years.are.you.at.FIB <- # answer pls
if (how.many.years.are.you.at.FIB == 0) {
  print("Welcome newcomer :)")
} else if (how.many.years.are.you.at.FIB >= 1 &
           how.many.years.are.you.at.FIB <= 4) {
  print("Still alive?")
} else {
  print("Good luck")
} 

# You can nest if-else statements
if (my.age <= 18) {
  if (how.many.years.are.you.at.FIB == 0) {
    print("Welcome newcomer :)")
  }
} else print("...")

# LOOPS ... !
seconds <- 10
while (seconds > 0) {
  print(seconds)
  seconds <- seconds - 1
  if (seconds == 0) print("BOOM")
}

# You can add "break" to exit the loop
range <- c(1:10)
for (i in range) {
  print(i)
}

for (i in 1:length(range)) {
  print(range[i])
}

# You can nest loops inside loops ...

# FUNCTIONS !

add.params <- function(param1, param2) {
  return(param1 + param2)
}

add.params(4,5)

# Before digging any further into our challenges ...
# meet the SAMPLE function

(die <- sample(1:6, size = 1))

# Let's check whether you are lucky. Obtain a 6 ... !
for (throw in 1:3) {
  if (sample(1:6, size = 1) == 6){
    print("You are lucky!")
    break;
  }
  if (throw == 3) {
    print("I cannot help you")
  }
}

## EXERCISE 10 MIN ##
## ============== ##
# Challenge 1: write a function that returns a power of 2 (of the parameter)

# Challen



