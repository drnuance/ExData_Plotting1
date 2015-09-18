library(dplyr)

input <- na.omit(read.table("../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")) %>%
                mutate(DateTime = paste(Date,Time)) %>%
                select(-Date, -Time) %>%
# `mutate` does not support `POSIXlt` results. so has to change to update
                mutate(DateTime = as.POSIXct(strptime(DateTime, format="%d/%m/%Y %H:%M:%S"))) %>%
        # note: just use date to generate strptime is midnight. 
        #So it isin correct to use 2007-02-02. Must add one day
                filter(DateTime >= strptime("2007-02-01", format="%Y-%m-%d"), DateTime < strptime("2007-02-03", format="%Y-%m-%d") )
        