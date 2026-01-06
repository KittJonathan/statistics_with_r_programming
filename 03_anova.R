# R Programming 101
# Statistics with R programming
# 03 - ANOVA using R programming
# https://www.youtube.com/watch?v=0EA5aPQpqYY&list=PLtL57Fdbwb_B5v9p9vGVjdjrvWZL7peTy&index=3
# 2026-01-06

# Load packages ----

library(tidyverse)

theme_set(theme_minimal())

# Prepare data ----

View(msleep)

my_data <- msleep |> 
  select(vore, sleep_rem) |> 
  drop_na()

my_data |> 
  ggplot(aes(x = sleep_rem)) +
  geom_density(fill = "lightblue", colour = "darkblue") +
  facet_wrap(~vore)

# Analysis of variance ----

# Is the average REM-sleep the same across eating habits?
# Null hypothesis: there is no difference.

mod1 <- aov(sleep_rem ~ vore, data = my_data)

summary(mod1)

# p-value = 0.0105 -> reject H0.

my_data |> 
  rstatix::anova_test(sleep_rem ~ vore, detailed = T)
