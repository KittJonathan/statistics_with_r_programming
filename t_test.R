# Statistics with R programming
# The t-test and paired t-test
# https://www.youtube.com/watch?v=U6mNNxsde_o

# Packages ----

library(tidyverse)
library(palmerpenguins)
library(rstatix)

# Explore data ----

glimpse(penguins)

# Independent t test ----

penguins |> 
  filter(species != "Gentoo") |>  
  drop_na(bill_length_mm) %>%
  {t.test(.$bill_length_mm ~ .$species)}

penguins |> 
  filter(species != "Gentoo") |>  
  drop_na(bill_length_mm) |> 
  t_test(bill_length_mm ~ species, 
         detailed = TRUE)

# Paired t test ----

head(datasets::sleep)

datasets::sleep |> 
  pivot_wider(id_cols = ID,
              names_from = group,
              values_from = extra,
              names_prefix = "drug_") %>%
  {t.test(.$drug_1, .$drug_2,
          paired = TRUE)}
  
