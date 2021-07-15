library(tidyverse)
library(robotstxt)
library(rvest)
library(scales)
library(dsbox)
paths_allowed("http://www.opensecrets.org")

url_2020 <- "https://www.opensecrets.org/political-action-committees-pacs/foreign-connected-pacs/2020"
page <- read_html(url_2020)
pac_2020 <- page %>% 
  html_node('.DataTable-Partial') %>% 
  html_table("td",header = TRUE, fill = TRUE) %>% 
  as_tibble()
pac_2020

glimpse(pac_2020)
pac_2020 <- pac_2020 %>% 
  rename(
    name = `PAC Name (Affiliate)`,
    country_parent = `Country of Origin/Parent Company`,
    total = Total,
    dems = Dems,
    repubs = Repubs
  )

glimpse(pac_2020)

pac_2020 <- pac_2020 %>% 
  mutate(name = str_squish(name))
glimpse(pac_2020)

nrow(pac_2020)
ncol(pac_2020)
install.packages("devtools")
devtools::install_github("rstudio-education/dsbox")
library(dsbox)
head(pac_all_raw)
pac_all_raw <- pac_all_raw %>% 
  separate(country_parent, into = c("country", "parent", sep = "/", extra = "merge"))

parse_currency <- function(x){
  x %>% 
    str_remove("\\$") %>% 
    str_remove_all("\\,") %>% 
    as.numeric()
}

pac_all <- pac_all_raw %>% 
  mutate(
    total = parse_currency(total),
    dems = parse_currency(dems),
    repubs = parse_currency(repubs)
  )
glimpse(pac_all)

pac_all %>% 
  filter(country %in% c("Canada", "UK")) %>% 
  group_by(country,year) %>% 
  summarise(tot=sum(total), .groups = "drop") %>% 
  ggplot(mapping = aes(x = year, y = tot, group = country, color = country)) +
  geom_line()

pac_all_final <-   pac_all %>% 
    filter(country == "UK") %>% 
    group_by(year) %>% 
    summarise(
      Democrat = sum(dems),
      Republican = sum(repubs),
      .groups = "drop"
    ) %>% 
    pivot_longer(
      cols = c(Democrat, Republican),
      names_to = "party",
      values_to = "amount"
    )
library(scales)
pac_all_final %>% 
  ggplot(mapping = aes(x = year, y = amount, color = party)) + 
  geom_line()+
  scale_color_manual(values = c("blue","red"))+
  scale_y_continuous(labels = label_dollar(scale = 0.000001, suffix = "M"))+
  labs(
    x = "Year",
    y = "Amount",
    color = "Party",
    title = "Contributions",
    subtitle = "By party, over time")+
  theme_minimal()















































































































