## This script creates plot1 for the Exploratory Data Project 1
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

## Code does not work yet. DateTime is all NA

x <- paste(hpc$Date, hpc$Time)
DateTime <- strptime(x, "%d/%m/%y %H:%M:%S")