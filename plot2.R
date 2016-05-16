##      PLOT2.R
##
##      R code to create plot2 in  Course Project 1 Exploratory Data Analysis.
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
png(file = "plot2.png")                                                         ## OPEN DEVICE
##
##      *****CREATING PLOT2*****
##
##      SCATTERPLOT
##
with(mydata, plot(Date+Time, Global_active_power, type = "n", xlab ="",ylab = "Global active power (kilowatts)")) ## DON'T PLOT.
with(mydata, lines(Date+Time, Global_active_power))                             ## PLOT LINE.
##
dev.off()                                                                       ## CLOSE GRAPHICS DEVICE.
##
##      *****END OF SCRIPT*****
