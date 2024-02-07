a <- import("barplot33.csv")

theme_set(theme_bw())

m9<- ggplot(a, aes(factor(time), kw, fill = demand)) +
  geom_bar(stat = "identity", position = "dodge", col = "skyblue4") +
  ylim(c(0,250)) +
  scale_fill_brewer(palette = "Pastel1") +
theme(axis.text.x = element_text(angle=65, vjust=1)) +
  labs(
       subtitle = "Setpoint Changed from 27C to 33C",
       x = "Time")


figure <- ggarrange(m1, m2, m3, m4, m5, m6, m7, m8, m9)

annotate_figure(figure,
                top = text_grob("Measured vs Simulated Energy for April 30, 2019",
                                face = "bold",
                                size = 14),
                left = text_grob("Power Demand", face = "bold", rot = 90))
