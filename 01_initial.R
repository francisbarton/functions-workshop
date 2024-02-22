
# Believe it or not, this is a function:
\() ""

# But not a very useful one.
# (and "lost" to us now)


# If we assign it a name, we can find it again
echo_nothing <- \() ""

# It still doesn't do anything interesting... but we can at least use it again
echo_nothing()

# `\()` is a shorthand (in R >= 4.1.0 only) for `function()`
echo_nothing2 <- function() ""
identical(echo_nothing, echo_nothing2)


# Let's make a marginally more useful function that processes an input
echo_input <- \(x) x
echo_input(6)
echo_input(mean(seq(10)))
echo_input(sample)

# The function is expecting an `x` value to be provided
x <- 5
# But you can't just call this in from the outside environment
echo_input()
# Although this will work:
echo_input(x = x)

# The important point there is that the x before the equals is a totally
# separate concept from the x after the equals

# A function will only check what it's expecting to get.
# Otherwise it _will_ look in the outside environment
y <- 5
multiply_input <- \(x) x * y
multiply_input(6)

multiply_input2 <- \(`6`) `6` * y
multiply_input2(6)

# Why will it look for y in the global environment, but not x?
