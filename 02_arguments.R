
# A more standard format to define a function than we did earlier:
divide <- function(x, y) {
  x / y
}

# Give it a try (it's not rocket science)
divide(3, 4)

# What happens if we try to get it to use an object from the global env?
y <- 4
divide(3)


divide(x = 3, y = y)
divide(y, 3)

# R processes the arguments in the order they are defined
z <- 12
divide(3, z)

# If you for some reason need to supply the arguments in a different order
# you will probably need to name them (*)
divide(y = z, x = y)

# Variables set within the function will 'win' over supplied variables
halve <- function(x, y) {
  z <- 2
  x / z
}

halve(6)

halve2 <- function(x, y) {
  x <- 4
  y <- 2
  x / y
}

halve2()

# This is silly: at this point we might as well not have any arguments
# at all if we're not going to use them.

# A 'pure' function will use all its arguments in some way, and will only rely
# on its arguments (not on what is in the global environment).
# This is what I mean by encapsulating a task.
# You can tell from the function code alone what it will do.
#
# The more you write pure functions, the more robust your code should be.

# Sometimes we want to use a default value in a function, and that's fine
mean_power <- function(x, y, power = 2) {
  mean(c(x, y)) ^ power
}

mean_power(5, 7)

# The user still has the ability to override the default value
mean_power(5, 7, 3)
