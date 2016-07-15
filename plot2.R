## This script creates plot2 for the Exploratory Data Project 1
##
## The script assumes the extracted data file household_power_consumption.txt
##   is in the working directory before running the script.
##
## The script creates and properly formats a data frame called hpc before
##   creating the plots.

hpcAll <- read.csv("~/Coursera/ExData_Proj1/household_power_consumption.txt",
                   sep=";", na.strings="?", stringsAsFactors=FALSE)
hpc <- subset(hpcAll, Date== "1/2/2007" | Date == "2/2/2007")
rm(hpcAll)   # Clean up name space

x <- paste(hpc$Date, hpc$Time)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
hpc <- cbind(DateTime, hpc)

## Create the plot

png(file="plot2.png", width=480, height = 480)
par(ann=F)
with(hpc, plot(DateTime, Global_active_power, type="l" ))
title(ylab = "Global Active Power (kilowatts)")
dev.off()