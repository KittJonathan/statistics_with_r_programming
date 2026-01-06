# R Programming 101
# Statistics with R programming
# 01 - Doing a t-test using R programming
# https://www.youtube.com/watch?v=x1RFWHV2VUU&list=PLtL57Fdbwb_B5v9p9vGVjdjrvWZL7peTy&index=1
# 2026-01-06

# Load packages ----

library(tidyverse)
library(rstatix)

theme_set(theme_minimal())

# Prepare data ----

my_data <- starwars |> 
  select(sex, height) |> 
  filter(sex %in% c("male", "female")) |> 
  drop_na(height)

# Is the average height of males in the Star Wars universe
# more than the average height of females?

my_data |> 
  ggplot(aes(x = height, fill = sex, colour = sex)) +
  geom_density(alpha = 0.4)

# T-test ----

# Null hypothesis: both genders have the same height

t.test(height ~ sex, data = my_data)

# p-value = 0.2431 -> not statistically significant

starwars |> 
  select(sex, height) |> 
  filter(sex %in% c("male", "female")) |> 
  drop_na(height) |> 
  rstatix::t_test(height ~ sex, detailed = TRUE)

t.test(
  formula = height ~ sex,
  data = my_data,
  alternative = "two.sided",
  mu = 0,
  var.equal = FALSE,
  conf.level = 0.95
)
