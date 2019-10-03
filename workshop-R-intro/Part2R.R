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

## EXERCISE  MIN ##
## =============== ##

# Challenge 1: Write a function that returns a power of 2 (of the parameter)

# Challenge 2: Complete this function 
pass <- function(marks) {
  # if the marks' mean is equal or above 5, return a TRUE logical
  
  # if the marks' mean is 5, return a FALSE logical
}

pass(c(5.1, 6.7, 4.3, 7.8))
pass(c(4.95, 4.25, 4.7, 6.1))

# Challenge 3: Complete this function and check your fate !
# Note: this function has no parameters

my.fate <- function() {
  # There are 5 cards with magic numbers
  cards <- c(42, 17, 11, 13, 1)
  
  # Please choose with sample() 2 cards:
  choice <- sample(...)
  
  # Compute second CHOSEN card + first CHOSEN card 
  i  <- ...
  fate <- (i + my.age) %% 6
  
  # Conditional flow (something is missing!)
  
  ... (fate == 0) {
    print ("You will be rich soon")
  } ... (fate == 1) {
    print ("You will be lucky soon")
  } ... == 2) {
    print ("You will find love soon")
  } ... (fate == 3) {
    print ("You will make friends soon")
  } ... {
    my.age <- abs(my.age - fate)
    my.fate() # Recursion in R does also exist !
  }
}

# Now check your fate:
my.fate()




