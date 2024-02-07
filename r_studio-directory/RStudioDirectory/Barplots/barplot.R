a <- import("setpoint27.csv")

theme_set(theme_bw())

ggplot(a, aes(factor(time), kw, fill = Demand)) +
  geom_bar(stat = "identity", position = "dodge", col = "skyblue4") +
  scale_fill_brewer(palette = "Pastel1") +
theme(axis.text.x = element_text(angle=65, vjust=1)) +
  labs(title="Average Measured and Simulated Power Demand for Sundays",
       subtitle = "Base Simulation (Uniform Setpoint @27C)",
       x="Time",
       y="Power in kW")
