## -----------------------------------------------------------------------------
library(sreg)
library(haven)
library(dplyr)

## -----------------------------------------------------------------------------
data(AEJapp)
data <- AEJapp

## -----------------------------------------------------------------------------
Y <- data$gradesq34
D <- data$treatment
S <- data$class_level
data.clean <- data.frame(Y, D, S)
data.clean <- data.clean %>%
  mutate(D = ifelse(D == 3, 0, D))
Y <- data.clean$Y
D <- data.clean$D
S <- data.clean$S
head(data.clean)

## -----------------------------------------------------------------------------
table(D = data.clean$D, S = data.clean$S)

## -----------------------------------------------------------------------------
result <- sreg::sreg(Y = Y, S = S, D = D)
print(result)

## -----------------------------------------------------------------------------
pills <- data$pills_taken
age <- data$age_months
data.clean <- data.frame(Y, D, S, pills, age)
data.clean <- data.clean %>%
  mutate(D = ifelse(D == 3, 0, D))
Y <- data.clean$Y
D <- data.clean$D
S <- data.clean$S
X <- data.frame("pills" = data.clean$pills, "age" = data.clean$age)
result <- sreg::sreg(Y, S, D, G.id = NULL, X = X)
print(result)

