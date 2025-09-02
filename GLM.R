library(readxl)
heart_disease <- read_excel("D:/New folder (3)/New folder (2)/STA 471 2.0 Generalized Linera Models and Non Linear models/New folder (2)/Heart_Disease.xlsx")
View(heart_disease)

heart_disease$target <- ifelse(test = heart_disease$target=="yes", yes= 1, no=0)
heart_disease$target <- as.factor(heart_disease$target)


heart_disease$sex <- as.factor(heart_disease$sex)
heart_disease$cp <- as.factor(heart_disease$cp)
heart_disease$fbs <- as.factor(heart_disease$fbs)
heart_disease$restecg <- as.factor(heart_disease$restecg)
heart_disease$exang <- as.factor(heart_disease$exang)
heart_disease$slope <- as.factor(heart_disease$slope)
heart_disease <- na.omit(heart_disease, cols = colnames(heart_disease) )


# Find main effects

logitFull <- glm(formula = target ~ ., data = heart_disease, family="binomial" )
summary(logitFull)

backward_model <- step(logitFull, direction = "backward")
summary(backward_model)

null_model <- glm(target ~ 1, data = heart_disease, family = "binomial")
forward_model <- step(null_model,
                      scope = list(lower = formula(null_model), upper = formula(logitFull)),
                      direction = "forward")
summary(forward_model)

stepwise_model <- step(null_model,
                       scope = list(lower = formula(null_model), upper = formula(logitFull)),
                       direction = "both")
summary(stepwise_model)

1-pchisq(10.35,1)

ncol(heart_disease)

heart_disease$target <- as.numeric(heart_disease$target) - 1


# Find main+interaction effects

all_interactions_model <- glm(target ~ (cp + oldpeak + ca + sex + slope + exang + chol + thalach)^2,
                              data = heart_disease,
                              family = binomial(link = "logit"))

null_model <- glm(target ~ cp + oldpeak + ca + sex + slope + exang + chol + thalach, data = heart_disease, family = binomial(link = "logit"))

upper_formula <- formula(all_interactions_model)

forward_model <- step(null_model,
                      scope = list(lower = formula(null_model), upper = upper_formula),
                      direction = "forward",
                      trace = TRUE)
summary(forward_model)





