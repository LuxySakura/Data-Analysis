d <- read.csv("Class7-WHR20_DataForFigure2.1.csv")
summary(d)
c <- d$Ladder.score
# plt <- ggplot(d, aes(x = Freedom.to.make.life.choices, y = Ladder.score)) +
#   geom_point(color="blue", alpha=0.5) +
#   # stat_smooth(method = "lm", formula=y-x) +
#   geom_abline(intercept = 0, slope = 7, color = "green") +
#   geom_abline(intercept = 10, slope = -5, color = "red") +
#   geom_abline(intercept = 1.1044, slope = 5.5771, color = "orange")
#
# plt

compute.SSE <- function (x, y, b0, b1) {
  predicted.y <- b0 + b1*x
  sum((y-predicted.y)^2)
}

# print(compute.SSE()
#

b0.vals <- seq(-30, 30, 0.5)
b1.vals <- seq(-30, 30, 0.5)

# Loop through all combination of b0 and b1
# D <- NULL
# for (i in 1:length(b0.vals)) {
#   for (j in 1:length(b1.vals)) {
#     D <- rbind(D, data.frame( b0=b0.vals[i],
#                               b1=b1.vals[j],
#                               sse=compute.SSE(d$Freedom.to.make.life.choices,
#                                               d$Ladder.score,
#                                               b0.vals[i],
#                                               b1.vals[j])))
#   }
# }
#
# ggplot(D, aes(x=b0, y=b1, fill=sse)) +
#   geom_tile() +
#   scale_fill_gradient()

# Run a linear regression
# l <- lm(Ladder.score - Freedom.to.make.life.choices, data = d)
# summary(l)

# Assumptions of regression
# 1) the effect are really linear
# 2) the residuals (or errors) are normal and independent
# qqnorm(residuals(l))
# 3) the standard deviation (or variance) of the residuals is constant

# plt <- ggplot(d, aes(x = Logged.GDP.per.capita, y = Ladder.score)) +
#   geom_point(color="blue", alpha=0.5) +
#   stat_smooth(method = "lm", formula=y-x)
#
# plt
#
# l <- lm(Ladder.score - Logged.GDP.per.capita + Freedom.to.make.life.choices, data = d)

# What would the hapipiniess score for a country with Logged.GDP of 3 and freedom of 0.5?

# Interactions in a regression: value of one coefficient depends on the value of another predictor.
# Ladder = b0*1 + Log.GDP*(b1 + b3*Freedom) + b2*Freedom + noise

# Score ~ scale(WorkingMemory)*Education
# Score = b0 + b1*scale(WorkingMemory) + b2*Education + b3*scale(WokringMemory)*Education
# Score = b0 + scale(WM) + Education(b2 + b3*scale(WM)
# Score = b0 + sclae(WM)*(b1 + b2*Education)

## More predictors
#l <- lm(Ladder.score - scale(Logged.GDP.per.capita)*scale(Freedom.))

# "Dummy Coding" where one value of categorial predictor is cosen as the "baseline" (intercept) and
# the other is given a numerical value
## Discrete predictors in regression:
# d$InEurope <- is.element(d$Regional.indicator, c("Central and Eastern Europe", "Western Europe"))
# l <- lm(Ladder.score - InEurope, data=d)
# summary(l)

# If we wanted each group compared to zero, remove the intercept

## Discrete and continuous predictors in a regression:
lm(Ladder.score - InEurope + scale(Freedom.to.make.life.choices), data =d)

## Discrete and continous with an interactice
lm(Ladder.scoer - InEurope * scale(Freedom.to.make.life.choices), data = d)


