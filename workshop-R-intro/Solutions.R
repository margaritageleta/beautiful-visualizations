# Intro challenges
max(data)

mean(data)

sum(data[,100] - data[1,])

length(data[data >= 5]) > length(data[data < 5])


# Part 2 challenges
my.fate <- function() {
  # There are 5 cards with magic numbers
  cards <- c(42, 17, 11, 13, 1)
  
  # Please choose with sample() 2 cards:
  choice <- sample(1:5, size = 2)
  #print(cards[choice])
  
  # Compute second CHOSEN card + first CHOSEN card 
  i  <- sum(cards[choice])
  #print(i)
  fate <- (i + my.age) %% 6
  #print((i + my.age))
  #print(fate)
  #print("========")
  
  # Conditional flow (something is missing!)
  
  if (fate == 0) {
    print ("You will be rich soon")
  } else if (fate == 1) {
    print ("You will be lucky soon")
  } else if (fate == 2) {
    print ("You will find love soon")
  } else if (fate == 3) {
    print ("You will make friends soon")
  } else {
    print("hi")
    my.age <- abs(my.age - fate)
    my.fate() # Recursion in R does also exist !
  }
}

my.age <- 20
for (i in 1:100) my.fate()


