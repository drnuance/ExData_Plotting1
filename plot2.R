source("prepareInput.R")
library(ggplot2)
library(scales)

g2 <- ggplot(data=input, aes(x= DateTime, y= Global_active_power)) + geom_line()
g2 <- g2 + scale_x_datetime(breaks = date_breaks("1 day"), labels = date_format("%a"))
g2 <- g2 + labs(x=NULL, y="Global Active Power (Kilowatts)") 
g2

png("plot2.png", width=480, height=480, bg ="transparent")
print(g2)
dev.off()