a <- import("charsign.csv")

theme_set(theme_bw())

ggplot(a, aes(temp, value)) +
    geom_point(col = "deeppink4", size = 2) +
  ylim(c(-100,100)) + xlim(c(24,33)) +
  labs(title = "Characteristic Signature",
     subtitle = "Setpoint Changed from 27C to 25C",
     x = "Outdoor Drybulb Temperature in Celcius",
     y = "Normalized Difference Between Measured and Simulated in %")
