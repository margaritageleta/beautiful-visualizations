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



