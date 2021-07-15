install.packages("ggplot2")
library(ggplot2)
install.packages("nycflights13")
library(nycflights13)
help(package = "nycflights13")
head(flights, n= 3)
dim(flights)

Alaska <- flights[flights$carrier == "AS",]
head(Alaska, n = 5)
dim(Alaska)

ggplot(data = Alaska, mapping = aes(x = dep_delay, y = arr_delay)) + 
    geom_point() + 
    labs(x = "Departure delay (minutes)", y = "Arrival delay (minutes)",
         title = "Alaska Airlines flights leaving NYC in 2013")

ggplot(data = Alaska, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_point(alpha = 0.5) + 
  labs(x = "Departure delay (minutes)", y = "Arrival delay (minutes)",
       title = "Alaska Airlines flights leaving NYC in 2013")

jitter.examples <- matrix(0, nrow = 10, ncol = 2)

jitter.examples <- as.data.frame(jitter.examples)
ggplot(data = jitter.examples, mapping = aes(x = V1, y = V2)) + 
    geom_jitter(width = 0.01, height = 0.01)

ggplot(data = Alaska, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_jitter(width = 30, height = 30) + 
  labs(x = "Departure delay (minutes)", y = "Arrival delay (minutes)",
       title = "Alaska Airlines flights leaving NYC in 2013")


install.packages("GGally")
library(GGally)

# Create data
data <- data.frame( var1 = 1:100 + rnorm(100,sd=20), v2= 1:100 + rnorm(100,sd=27),v3=rep(1,100) + rnorm(100, sd =1))
data$v4 = data$var1 ** 2
data$v5 = -(data$var1 ** 2)

# Check correlations(as scatterplots), distribution and print correlation coefficient
ggpairs(data, title="Scatterplot matrix with ggpairs(")
install.packages("installr")
require(installr)

head(weather, n = 3)

ggplot(data = weather, mapping = aes(x = temp)) +
  geom_histogram()

ggplot(data = weather, mapping = aes(x = temp)) +
  geom_histogram(bins = 10, color = "red")

colors()
ggplot(data = weather, mapping = aes(x = temp)) +
  geom_histogram(binwidth = 6, color = "white", fill = "skyblue") +
  labs(x = "Temperature(Hourly)",
       title = "Hourly temperature from NYC in 2013")
mean(na.omit(weather$temp))
median(na.omit(weather$temp))

summary(weather$temp)

weather$month
factor(weather$month)

ggplot(data = weather, mapping = aes(x = factor(month), y = temp)) +
  geom_boxplot(fill = "steelblue") +
  labs(x = "Month", y = "Temperature(Hourly)",
       title = "Hourly temperatures from NYC in 2013 by month") +
  scale_x_discrete(labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                              "jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

carrier.freq <- table(flights$carrier)
carrier.freq <- as.data.frame(carrier.freq)
carrier.freq
colnames(carrier.freq) <- c("carrier", "number")

ggplot(data = carrier.freq, mapping = aes(x = carrier, y = number)) +
  geom_col() +
  labs(x = "Carrier", y = "Count", title = "Carriers who flew out of New Yor City in 2013")
airlines

carrier.origin <- table(flights$origin, flights$carrier)
carrier.origin <- as.data.frame(carrier.origin)
colnames(carrier.origin) <- c("origin", "carrier", "number")

ggplot(data = carrier.origin, mapping = aes(x = carrier, y = number, fill = origin)) +
  geom_col() +
  facet_wrap(~ origin, ncol = 1)
  labs(x = "Carrier", y = "Count",
       title = "Carriers who flew out of New York City in 2013")

  # 1.柱状图通常用来呈现变量的分布，而条形图通常用来比较鼻梁；
  # 2.柱状图将数据按照一定的区间分组，而条形图将数据分类；
  # 3.柱状图的柱之间一般是有空隙的，而条形图的条之间一般不能有空白；
  # 4.柱状图的横轴是量化数据，而条形图的横轴是类别；
  # 5.柱状图不同柱一般不能重新排序，而条形图不同条可以任意重新排序。
  
Newark.Jan <- weather[weather$origin == "EWR" & weather$month == 1,]
dim(Newark.Jan)

ggplot(data = Newark.Jan, mapping = aes(x = time_hour, y = temp)) +
  geom_line() +
  labs(x = "Time(Hours)", y = "Temperature",
       title = "Hourly Temperature at Newark Airport in January 2013")

library(gridExtra)

p1 <- ggplot(data = Alaska, mapping = aes(x = dep_delay, y = arr_delay)) +
  geom_jitter(width = 30, height = 30) +
  labs(x = "Departute delay(minutes)", y = "Arrival delay (minutes)",
       title = "Alaska Airlines flights levaing NTC in 2013") +
  theme(plot.title = element_text(size = 7))

p2 <- ggplot(data = weather, mapping = aes(x = factor(month), y = temp)) +
  geom_boxplot(fill = "steelblue") +
  labs(x = "month", y = "Temperature(Hourly)",
       title = "Hourly temperatures from NYC in 2013 by month") +
  scale_x_discrete(labels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun",
                              "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")) +
  theme(plot.title = element_text(size = 7))

p3 <- ggplot(data = carrier.freq, mapping = aes(x = carrier, y =number)) +
  geom_col() +
  labs(x = "carrier", y = "count",
       title = "carriers who flew out of new york city in 2013") +
  theme(plot.title = element_text(size = 7))

p4 <- ggplot(data = Newark.Jan, mapping = aes(x = time_hour, y = temp)) +
  geom_line() +
  labs(x = "time(hours)", y = "temperature",
       title = "hourly temperature at newark airport in January 2013") +
  theme(plot.title = element_text(size = 7))
grid.arrange(p1,p2,p3,p4,ncol=2)























