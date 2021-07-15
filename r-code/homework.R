library(ggplot2)
library(nycflights13)

# task1
flights
flights.jba <- subset(flights, flights$carrier == "B6")
flights.jba
dim(flights.jba)
ggplot(data = flights.jba, mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_jitter(width = 10, height = 10, alpha = 0.5) +
  labs(x = "Departure delays", y = "Arrival delays", 
       title = "The relationship between them")

#task2
weather.ewr <- weather[weather$origin == "EWR",]
head(weather.ewr)
dim(weather.ewr)
ggplot(data = weather.ewr, mapping = aes(x = temp)) +
  geom_histogram(binwidth = 5, color = "white", fill = "skyblue") +
  labs(x = "Temperature(Hourly)", y = "Counts",
       title = " the hourly temperature from Newark Liberty International")

#task3
flights$origin
weather
weather.jfk <- weather[weather$origin == "JFK",]
weather.jfk <- weather.jfk[weather.jfk$month==5 | weather.jfk$month==6 | weather.jfk$month==7 | weather.jfk$month==8 | weather.jfk$month==9,]
head(weather.jfk)
dim(weather.jfk)
factor(weather.jfk$month)
ggplot(data = weather.jfk, mapping = aes(x = factor(month), y = temp)) +
  geom_boxplot(fill = "steelblue") +
  labs(x = "month", y = "temp",
       title = "Boxplots") +
  scale_x_discrete(labels = c("May", "Jun", "Jul", "Aug", "Sep"))

#task4
head(mtcars)
mtcars.cyl <- table(mtcars$cyl, mtcars$am)
mtcars.cyl <- as.data.frame(mtcars.cyl)
colnames(mtcars.cyl) <- c("cylinders", "autotransmission", "number")
head(mtcars.cyl)
ggplot(data = mtcars.cyl, mapping = aes(x = cylinders, y = number, fill = autotransmission)) +
  geom_col() +
  facet_wrap(~ cylinders, ncol = 1)
  labs(x = "the automobiles transmission", y = "the number of cylinders",
       title = "the relationship")
  
carrier.origin <- table(flights$origin, flights$carrier)
carrier.origin <- as.data.frame(carrier.origin)
colnames(carrier.origin) <- c("origin", "carrier", "number")
  
ggplot(data = carrier.origin, mapping = aes(x = carrier, y = number, fill = origin)) +
  geom_col() +
  facet_wrap(~ origin, ncol = 1)
labs(x = "Carrier", y = "Count",
     title = "Carriers who flew out of New York City in 2013")
  
#task5
Newark.Jan <- weather[weather$origin == "EWR" & weather$month == 1,]
dim(Newark.Jan)

weather.lga <- weather[weather$origin == "LGA",]
weather.lga <- weather.lga[weather.lga$month == 10,]
weather.lga <- as.data.frame(weather.lga)

ggplot(data = weather.lga, mapping = aes(x = time_hour, y = temp)) +
  geom_line() +
  labs(x = "Time(Hours)", y = "Temperature",
       title = "Hourly Temperature at LGA Airport in January 2013")











































































