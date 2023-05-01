d <- read.csv("FAKE-YerkesDodson.csv")

l <- lm(performance ~ arousal + (arousal^2), data=d)
summary(l)
plot(d$arousal, d$performance)
lines(predict(l), col=4)

# poly function
l1 <- lm(performance ~ poly(arousal, 4), data = d)
plot(d$arousal, d$performance)
lines(predict(l1), col=4)

# There's a tradeoff in number of parameters and fit to data and generalization
small.d <- d[1:20,]
l <- lm(performance ~ poly(arousal, 18), data = small.d)
plot(small.d$arousal, small.d$performance)
lines(predict(l), col=4)

# Two tools dealing with nonlinear data
ggplot(d, aes(x=arousal, y=performance)) +
  geom_point() +
  stat_smooth(method = "loess") +
  theme_bw()