library(magrittr)

df <- mtcars %>%
  group_by(cyl) %>%
  summarise(mean_mpg = mean(mpg))
df

# Test
df <- mtcars
df <- group_by(df, cyl)
df <- summarise(df, mean_mpg = mean(mpg))
df
