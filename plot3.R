source("prepareInput.R")
library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)

input3 <- gather(input, sub_meters, sub_usage, Sub_metering_1:Sub_metering_3)

g3 <- ggplot(data=input3, aes(x= DateTime, y=sub_usage, color=sub_meters)) 
g3 <- g3 + geom_line()
g3 <- g3 + scale_x_datetime(breaks = date_breaks("1 day"), labels = date_format("%a"))
g3 <- g3 + labs(x=NULL, y="Energy sub metering") 
g3 <- g3 + theme(
        legend.position=c(0.85, 0.87),
        legend.background = element_rect(fill="white"),
        legend.title=element_text(colour="white")
)
g3

png("plot3.png", width=480, height=480, bg ="transparent")
print(g3)
dev.off()