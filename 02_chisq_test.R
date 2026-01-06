# R Programming 101
# Statistics with R programming
# 02 - Chi-squared test using R programming
# https://www.youtube.com/watch?v=cJRPZ8HD-zI&list=PLtL57Fdbwb_B5v9p9vGVjdjrvWZL7peTy&index=2
# 2026-01-06

# Load packages ----

library(tidyverse)

theme_set(theme_minimal())

# Prepare data ----

View(gss_cat)

my_data <- gss_cat |> 
  select(marital) |> 
  filter(marital %in% c("Married", "Never married", "Divorced")) |> 
  mutate(marital = fct_drop(marital))

my_data |> 
  ggplot(aes(x = marital)) +
  geom_bar()

my_table <- table(my_data)
my_table

# Chi-squared test ----

# Chi-squared test: are the proportions different?
# Null hypothesis: there is no difference, all categories are the same.

chisq.test(my_table)

# p-value < 2.2e-16 -> extremely unlikely that if we had equal proportions,
# we would see a difference of the size that we are seing -> statistically 
# significant.

my_data |> 
  table() |> 
  chisq.test()

my_data |> 
  table() |> 
  rstatix::chisq_test()