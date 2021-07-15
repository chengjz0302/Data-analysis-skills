install.packages("robotstxt")
library(robotstxt)
paths_allowed("http://www.imdb.com")
library(rvest)
page <- read_html("https://www.imdb.com/chart/top/")
page
typeof(page)
class(page)

titles <- page %>%
  html_nodes(".titleColumn a") %>%
  html_text()
titles

years <- page %>%
  html_nodes(".secondaryInfo") %>%
  html_text()
years













































































