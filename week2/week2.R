install.packages("tidyverse")
library(tidyverse)
library(nycflights13)
install.packages('fivethirtyeightdata', repos
                 =
                   'https://fivethirtyeightdata.github.io/drat/',
                 type = 'source')
library(fivethirtyeight)

dim(flights)
head(flights)
glimpse(flights)
dim(airlines)
dim(planes)

glimpse(airports)
?airports

library(readr)
dem_score <- read.csv("https://moderndive.com/data/dem_score.csv")
dem_score

guat_dem <- dem_score %>%
#The pipe operator can be read as ¡°then¡±
  filter(country == "Guatemala")
guat_dem

guat_tidy <- gather(data = guat_dem,
                    key = year,
                    value = democracy_score,
                    - country)
guat_tidy

ggplot(data = guat_tidy, mapping = aes(x = parse_number(year), y = democracy_score)) +
  geom_line() +
  labs(x = "year")

dem_score
dem_score.tidy <- gather(data = dem_score,
                         key = year,
                         value = democracy_score,
                         -country)
dem_score.tidy

life_exp_scores <- read_csv("https://moderndive.com/data/le_mess.csv")
head(life_exp_scores)
life_exp_scores.tidy <- gather(data = life_exp_scores,
                         key = year,
                         value = life_exp,
                         -country)
head(life_exp_scores.tidy)

library(dplyr)
starwars[,c("name", "starships")]

starwars[10,"starships"][[1]]

kids <- data.frame(age = c(4,11), weight = c(15,28), height = c(101, 132), gender = c("f", "m"))
rownames(kids) <- c("Sarah", "John")
kids

library(tibble)
kidstibble <- as_tibble(kids)
kidstibble
kidstibble$name <- rownames(kids)
kidstibble <- kidstibble[,c("name", "age", "weight", "height", "gender")]
kidstibble

kidstibble2 <- rownames_to_column(kids)
kidstibble2 <- as_tibble(kidstibble2)
kidstibble2

kidsdf <- as.data.frame(kidstibble)
kidsdf
kidstibble <- tibble(name=c("Sarah", "John"), age=c(4,11), weight=c(15,28),
                     height=c(101,132), gender=c("f", "m"))
kidstibble

kidstibble <- tribble(~name, ~age, ~weight, ~height, ~gender,
                      "sarah", 4, 15, 101, "f",
                      "John", 11, 28, 132, "m")
kidstibble

glimpse(kids)
?join

mtcars = mtcars %>%
  mutate(
    km_per_litre = 0.425*mpg
  )
mtcars
head(my)












































