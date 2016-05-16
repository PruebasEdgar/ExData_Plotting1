##      PLOT3.R
##
##      R code to create plot2 in  Course Project 1.
##
##      Dataset: Electric power consumption
##      Description: Measurements of electric power consumption in one household with a one-minute sampling 
##      rate over a period of almost 4 years. Different electrical quantities and some sub-metering values 
##      are available.
##
##      Dates to use: 2007-02-01 to 2007-02-02.
##
##
##      *****GETTING DATA SET*****
##
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileURL, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")                                      
##      
##      *****READING DATA AND CLEANING*****
##
library(data.table)
library(dplyr)
library(lubridate)
mydata <- fread("household_power_consumption.txt", sep = ";", na.strings ="?")  ## RAW DATA
mydata$Date <- dmy(mydata$Date)                                                 ## FORMAT DATE YYYY-MM-DD
mydata <- filter(mydata, (Date >= "2007-02-01") & (Date <= "2007-02-03"))       ## SUBSETTING DATA BY DATE.  
mydata <- mydata[1:2881,]                                                       ## INCLUDE 2007-02-03 00:00:00
mydata$Time <- hms(mydata$Time)                                                 ## FORMAT TIME HMS
                                                                                ## QUICK AND DIRTY TIDY DATA SET!!!
png(file = "plot3.png")                                                         ## OPEN DEVICE
##
##      *****CREATING PLOT3*****
##
##      SCATTERPLOT x 3
##
##      SUBMETERING ONE
##
with(mydata, plot(Date+Time, Sub_metering_1, type = "n", xlab ="",ylab = "Energy sub metering")) ## DON'T PLOT.
with(mydata, lines(Date+Time, Sub_metering_1, col = "black"))                   ## PLOT LINE.
##
##     SUBMETERING TWO
##
with(mydata, lines(Date+Time, Sub_metering_2, col = "red"))                   ## PLOT LINE.
##
##     SUBMETERING THREE
##
with(mydata, lines(Date+Time, Sub_metering_3, col = "blue"))                   ## PLOT LINE.
##
##      INSERT LEGEND
##
legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
col = c("black", "red", "blue")
lwd = c(2,2,2)
legend("topright", lwd = lwd, col = col, legend = legend, cex=0.8)
##
dev.off()                                                                       ## CLOSE GRAPHICS DEVICE.
##
##      *****END OF SCRIPT*****
