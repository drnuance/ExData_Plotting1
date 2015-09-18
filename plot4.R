source("prepareInput.R")
source("plot2.R")
source("plot3.R")
library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)
library(gridExtra)

g4.1 <- g2

g4.2 <- ggplot(data=input, aes(x= DateTime, y=Voltage)) + geom_line()
g4.2 <- g4.2 + scale_x_datetime(breaks = date_breaks("1 day"), labels = date_format("%a"))
g4.2 <- g4.2 + labs(x="datetime", y="Voltage") 

g4.3 <- g3

g4.4 <- ggplot(data=input, aes(x= DateTime, Global_reactive_power)) + geom_line()
g4.4 <- g4.4 + scale_x_datetime(breaks = date_breaks("1 day"), labels = date_format("%a"))
g4.4 <- g4.4 + labs(x="datetime", y="Golobal_reactive_power") 

png("plot4.png", width=480, height=480, bg ="transparent")
grid.arrange(g4.1, g4.2, g4.3, g4.4, ncol=2)
dev.off()