# Based on some code seen in the wild...

library(dplyr)

film <- "A New Hope"
starwars_2 <- starwars |>
  tidyr::unnest_longer(films) |>
  dplyr::filter(films == film)


# Some original example code

droids_mean_height <- starwars_2 |>
  filter(species == "Droid") |>
  summarise(droid_mean_height = mean(height, na.rm = TRUE))


ewoks_mean_height <- starwars_2 |>
  filter(species == "Ewok") |>
  summarise(ewok_mean_height = mean(height, na.rm = TRUE))

rm(droids_mean_height)

# First steps to convert to a function...

# Give it a name and just wrap it
get_species_mean_height <- function() {
  droids_mean_height <- starwars_2 |>
    filter(species == "Droid") |>
    summarise(droid_mean_height = mean(height, na.rm = TRUE))
}

# Does it work?
get_species_mean_height()

# !
droids_mean_height

droids_mean_height <- get_species_mean_height()
droids_mean_height

rm(droids_mean_height)

# We don't need to specify the name of the returned object within the function
get_species_mean_height <- function() {
  starwars |>
    filter(species == "Droid") |>
    summarise(droid_mean_height = mean(height, na.rm = TRUE))
}

get_species_mean_height()

my_droids_mean_height <- get_species_mean_height()
my_droids_mean_height

# What are the things that vary between the two original code chunks?
# Extract these into function arguments...
# or ask "Do I need this to be different?"

# Let's write it together
















# film <- "The Force Awakens"
# starwars_2 <- starwars |>
#   tidyr::unnest_longer(films) |>
#   dplyr::filter(films == film)

