#Task1
install.packages("rvest")
library(rvest)
paths_allowed("https://www.billboard.com/")
page <- read_html("https://www.billboard.com/charts/billboard-global-200")
page
typeof(page)
class(page)

names <- page %>%
  html_nodes(".text--truncate.color--primary") %>%
  html_text()
names

last1 <- page %>%
  html_nodes(".text--last") %>%
  html_text()
last <- c()
last.len <- seq(1:400)
last.len
for (i in last.len) {
  if (i %% 2 == 0) {
    last <- cbind(last,last1[i])
  }
}
t(last)
last <- as.numeric(last)
last <- as.data.frame(last)
last

peak1 <- page %>%
  html_nodes(".text--peak") %>%
  html_text()
peak <- c()
peak.len <- seq(1:400)
peak.len
for (i in peak.len) {
  if (i %% 2 == 0) {
    peak <- cbind(peak,peak1[i])
  }
}
t(peak)
peak <- as.numeric(peak)
peak <- as.data.frame(peak)
peak

weeks_onchart1 <- page %>%
  html_nodes(".text--week") %>%
  html_text()
weeks_onchart <- c()
week.len <- seq(1:400)
week.len
for (i in week.len) {
  if (i %% 2 == 0) {
    weeks_onchart <- cbind(weeks_onchart,weeks_onchart1[i])
  }
}
weeks_onchart
t(weeks_onchart)
weeks_onchart <- as.numeric(weeks_onchart)
weeks_onchart <- as.data.frame(weeks_onchart)
weeks_onchart

library(tibble)
rankstibble <- cbind(names, last, peak, weeks_onchart)
head(rankstibble)
rankstibble <- as_tibble(rankstibble)
head(rankstibble)

write.csv(rankstibble, "Data.xls")

str(rankstibble)











