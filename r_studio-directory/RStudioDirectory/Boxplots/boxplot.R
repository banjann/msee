e <- import("energy.csv")

#boxplot tempvtime

theme_set(theme_bw())

g <- ggplot(e, aes(as.factor(time), drybulb))
g + geom_boxplot(fill = "paleturquoise1", col = "slateblue4") +
  geom_dotplot(binaxis = 'y',
               stackdir = 'center',
               dotsize = .25,
               fill = "seagreen") +
  theme(axis.text.x = element_text(angle=65, vjust=1)) +
  labs(title="Outdoor Drybulb Temperature",
       subtitle = "Simulation Result for April 2019",
       x="Time",
       y="Drybulb Temperature in C")

