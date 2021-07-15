library(arm)
library(broom)
library(ggstance)
library(jtools)

data <- read.csv("dataset18.csv")

str(data)

levels(as.factor(data$animal_type))
levels(as.factor(data$intake_type))
levels(as.factor(data$outcome_type))
levels(as.factor(data$chip_status))

hist(data$time_at_shelter)
mean(data$time_at_shelter) # calculate mean
var(data$time_at_shelter) # calculate variance

#model <- glm(as.factor(time_at_shelter) ~ animal_type + month + year + intake_type + outcome_type + chip_status, data = data, family = binomial(link = "logit"))

#model <- glm(time_at_shelter ~ ., data = data[,c(-2,-3)], family = poisson())

model1 <- glm(time_at_shelter ~ animal_type, data = data, family = poisson(link = "log"))
model1 %>% summary()
model2 <- glm(time_at_shelter ~ intake_type, data = data, family = poisson(link = "log"))
model2 %>% summary()
model3 <- glm(time_at_shelter ~ outcome_type, data = data, family = poisson(link = "log"))
model3 %>% summary()
model4 <- glm(time_at_shelter ~ chip_status, data = data, family = poisson(link = "log"))
model4 %>% summary()


poisson.model1 <- glm(time_at_shelter ~ ., data = data[,c(-1,-2,-3)], family = poisson(link = "log"))
summary(poisson.model1)

poisson.model2 <- glm(time_at_shelter ~ ., data = data[,c(-1,-2,-3)], family = quasipoisson(link = "log"))
summary(poisson.model2)


# extract coefficients from first model using 'coef()'
coef1 <- coef(poisson.model1)

# extract coefficients from second model
coef2 <- coef(poisson.model2)

# extract standard errors from first model using 'se.coef()'
se.coef1 <- se.coef(poisson.model1)

# extract standard errors from second model
se.coef2 <- se.coef(poisson.model2)

# use 'cbind()' to combine values into one dataframe
models.both <- cbind(coef1, se.coef1, coef2, se.coef2, exponent = exp(coef1))

# show dataframe
models.both

# plot regression coefficients for poisson.model2
plot_summs(poisson.model2, scale = TRUE, exp = TRUE)

# plot regression coefficients for poisson.model1
plot_summs(poisson.model1, scale = TRUE, exp = TRUE)





















#c1 = coef(model)



#confint(model) # 95% CI for the coefficients
#exp(coef(model)) # exponentiated coefficients
#exp(model$coefficients)
#exp(confint(model)) # 95% CI for exponentiated coefficients
#predict(model, type="response") # predicted values
#residuals(model, type="deviance") # residuals












