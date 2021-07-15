# firstly, you should read the file
library(ggplot2)
library(dplyr)
library(moderndive)
library(gapminder)
library(skimr)
library(kableExtra)
library(gridExtra)
cats <- read.csv("cats.csv")
cats <- as.data.frame(cats)
head(cats)

# Secondly, you should tell readers the information
# of this form
nrow(cats)
ncol(cats)

# Thirdly, display the observations and variables
# The variables are their gender, heart weight
# in grams(Hwt) and body weight in kilograms(Bwt)

# Data analysis
# Step 1
# show the scatterplot
cats %>% 
  ggplot(aes(x = Bwt, y = Hwt)) +
  geom_point() +
  labs(x = "Body weight in kilograms", y = "Heart weight in grams",
       title = "The relationship between Hwt and Bwt")

# Step 2
# you should group them by gender and 
# make them displayed in different color
cats %>% 
  ggplot(aes(x = Bwt, y = Hwt, color= Sex)) +
  geom_point() +
  labs(x = "Body weight in kilograms", y = "Heart weight in grams",
       title = "The relationship between Hwt and Bwt")

# Step 3
cats.model <- cats %>% 
  lm(formula = Hwt~Bwt)
$$y_i = \alpha + \beta x_i + \epsilon_i, ~~~~ \epsilon_i \sim N(0, \sigma^2),$$
```{r, eval = TRUE}
model <- lm(score ~ bty_avg, data = evals.scores)
Coefs <- round(coef(model), 3)
```
Coefs <- round(coef(cats.model), 3)
$$\widehat{\mbox{Bodyweight\_kg}} = `r Coefs[1]` +
`r Coefs[2]` \cdot \mbox{Heartweight\_grams}.$$


cats %>% 
ggplot(aes(x = Bwt, y = Hwt, color= Sex)) +
geom_point() +
labs(x = "Body weight in kilograms", y = "Heart weight in grams",
     title = "The relationship between Hwt and Bwt")




update.packages(ask = FALSE, checkBuilt = TRUE)
tinytex::tlmgr_update()




$$\widehat{\mbox{Height_cm}} = \widehat{\alpha} + \widehat{\beta}_{\mbox{F}} \cdot \mathbb{I}_{\mbox{F}}(x)$$
  Where
$\widehat{\mbox{Height_cm}}$ is the expected value of the heart weight of the $i$th cat in the sample;
the intercept $\widehat{\alpha}$ is the mean heart weight for the baseline category of females;
$\widehat{\beta}_{F}$ is the difference in the mean heart weight of a males relatively to the baseline category females;
$\mathbb{I}_{F}(i)$ is an indicator function such that
$$\mathbb{I}_{\mbox{F}}(i)=\left\{
  \begin{array}{ll}
  1 ~~~ \mbox{if position of} ~ i \mbox{th observation is Forward},\\
  0 ~~~ \mbox{Otherwise}.\\
  \end{array}
  \right.$$
    When this model is fitted to the data, the following estimates of $\alpha$(intercept) and $\beta_{Forw}(PosF)$ are returned:












































































