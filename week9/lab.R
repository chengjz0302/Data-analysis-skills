library(tidyverse)
library(moderndive)
library(gapminder)

library(sjPlot)
library(stats)

library(jtools)

evals.gender <- evals %>% 
  select(gender,age)

ggplot(data = evals.gender, aes(x = gender, y = age, fill = gender))+
  geom_boxplot()+
  labs(x = "Gender", y = "Age")+
  theme(legend.position = "none")

model <- glm(gender~age, data = evals.gender,
             family = binomial(link = "logit"))
# family argument, which states the distribution and
# link function we would like to use
model %>% 
  summary()
summ(model)

modelcoefs <- round(coef(model), 2)
modelcoefs

library(kableExtra)
confint(model) %>% 
  kable()

mod.coef.logodds <- model %>% 
  summary() %>% 
  coef()

age.logodds.lower <- mod.coef.logodds["age","Estimate"]-
  1.96*mod.coef.logodds["age","Std. Error"]
age.logodds.upper <- mod.coef.logodds["age","Estimate"]+
  1.96*mod.coef.logodds["age","Std. Error"]

plot_model(model, show.values = TRUE, transform = NULL,
           title = "Log-Odds(Male instructor)", show.p = FALSE,
           vline.color = "blue")

# Some of the interesting arguments that can be passed to the plot_model function are:
#   
# show.values = TRUE/FALSE: Whether the log-odds/odds values should be displayed;
# show.p = TRUE/FALSE: Adds asterisks that indicate the significance level of estimates to the value labels;
# transform: A character vector naming the function that will be applied to the estimates. The default transformation uses exp to display the odds ratios, while transform = NULL displays the log-odds; and
# vline.color: colour of the vertical ¡°zero effect¡± line.















































































