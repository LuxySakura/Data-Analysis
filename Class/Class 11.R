
# l0 <- lm(y ~ x, data = d)
# l1 <- lm(y~x+z, data = d)
#
# print(anova(l0, l1))
# anova gives back an F-statistic, which is the ratio of the amount of variance explained

# F-test: ratio of the amount of variance explained
# F-distribution: ratio of chi-squared variables
# chi-squared distribution: distribution of the sum of squares of a normal

library("ggplot2")

d <- read.csv("titanic.csv",header = T)

summary(lm(Survived ~ Fare, data = d))

ggplot(d, aes()) +
  geom_point() +
  stat_smooth(method = "lm")

ggplot(d, aes(x=Pclass, y=Survived)) +
  stat_summary(fun.y = mean, geom = "bar", fill = "lightpurple") +
  stat_summary(fun.data = mean_se, geom = "errorbar")
