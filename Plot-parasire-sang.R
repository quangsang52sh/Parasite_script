rm(list = ls())
if (!require("ggplot2")) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2) 
}
P_data <- read.csv(file.choose(),header = T)
plot <- ggplot(P_data, aes(Day,Mean_Intensity_Parasite, color = factor(Month))) + geom_line(size = 0.6) +geom_point(size = 2) + labs(x = "Day", y = "Mean_Intensity") + theme(legend.position = "top")
plot
if (!require("gganimate")) {
  install.packages("gganimate", dependencies = TRUE)
  library(gganimate)
}
plot + geom_point(aes(group = seq_along(Day))) + transition_reveal(Day)
Animate_plot <- plot + geom_point(aes(group = seq_along(Day))) + transition_reveal(Day)
animate(Animate_plot, fps = 10, width = 750, height = 450)
anim_save("Animate_plot_new.gif")
