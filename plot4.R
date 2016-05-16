##      PLOT4.R
##
##      R code to create plot4in  Course Project 1.
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
png(file = "plot4.png")                                                         ## OPEN DEVICE
##
##      *****CREATING PLOT4*****
##
##      CREATING SCATTERPLOT x 4 
##
par(mfrow = c(2,2))                                                             ## 2x2 GRID
##
##      SUBMETERING ONE
##
with(mydata, plot(Date+Time, Global_active_power, type = "n", xlab ="",ylab = "Global active power")) ## DON'T PLOT.
with(mydata, lines(Date+Time, Global_active_power))                             ## PLOT LINE.
##
##     SUBMETERING TWO
#
with(mydata, plot(Date+Time, Voltage, type = "n", xlab ="datetime",ylab = "Voltage"))   ## DON'T PLOT.
with(mydata, lines(Date+Time, Voltage))                                         ## PLOT LINE.
##
##     SUBMETERING THREE
##
with(mydata, plot(Date+Time, Sub_metering_1, type = "n", xlab ="",ylab = "Energy sub metering")) ## DON'T PLOT.
with(mydata, lines(Date+Time, Sub_metering_1, col = "black"))                   ## PLOT LINE.
with(mydata, lines(Date+Time, Sub_metering_2, col = "red"))                     ## PLOT LINE.
with(mydata, lines(Date+Time, Sub_metering_3, col = "blue"))                    ## PLOT LINE.
##
##      INSERT LEGEND SUBMETERING THREE
##
legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
col = c("black", "red", "blue")
lwd = c(2,2,2)
legend("topright",  bty = "n", lwd = lwd, col = col, legend = legend)
##
##     SUBMETERING FOUR
#
with(mydata, plot(Date+Time, Global_reactive_power, type = "n", xlab ="datetime",ylab = "Global_reactive_power"))   
with(mydata, lines(Date+Time, Global_reactive_power))                                         ## PLOT LINE.
##
##
dev.off()                                                                       ## CLOSE GRAPHICS DEVICE.
##
##      *****END OF SCRIPT*****
