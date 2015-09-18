source("prepareInput.R")
library(ggplot2)

g1 <- ggplot(data=input, aes(input$Global_active_power)) + geom_histogram(col="black", 
                                                                         fill="red")
g1 <- g1+ labs(title="Global Active Power") +
        labs(x="Gloabl Active Power (kilowatts)", y="Frequency") + 
        xlim(c(0,6)) + 
        ylim(c(0,1200))
g1

png("plot1.png", width=480, height=480, bg ="transparent")
print(g1)
dev.off()
