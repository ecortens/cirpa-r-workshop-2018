# Modeling

library(tidyverse)
library(modelr)

df <- read_csv('Bike-Sharing-Dataset/day.csv')

df %>%
  ggplot(aes(x = dteday, y = cnt)) +
  geom_line() +
  facet_wrap(~season)

df %>%
  mutate(samp = sample(1:3, n(), replace = TRUE)) %>%
  group_by(samp) %>%
  tally()

df %>%
  mutate(samp = sample(c(1,1,1,2,3), n(), replace = TRUE)) %>%
  group_by(samp) %>%
  tally()

# train your model with this data
df %>%
  filter(samp == 1) -> training

# use this to get your different models.
df %>%
  filter(samp == 2) -> query

# use this test data only once -- to see how your model did.
df %>%
  filter(samp == 3) -> test