## This script creates plot4 for the Exploratory Data Project 1
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

png(file="plot4.png", width=480, height = 480)
par(mfrow = c(2,2))

## Pane 1
with(hpc, plot(DateTime, Global_active_power, type="l", 
               ylab = "Global Active Power"))

## Pane 2
with(hpc, plot(DateTime, Voltage, type="l"))


## pane 3
with(hpc, plot(DateTime, Sub_metering_1, type="l", 
               ylab="Energy sub metering"))
with(hpc, lines(DateTime, Sub_metering_2, col="red", type="l"))
with(hpc, lines(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), lwd=2)

##Pane 4
with(hpc, plot(DateTime, Global_reactive_power, type="l"))

dev.off()