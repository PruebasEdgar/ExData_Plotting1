##      PLOT1.R
##
##      R code to create plot1 in  Course Project 1.
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
mydata <- filter(mydata, (Date >= "2007-02-01") & (Date <= "2007-02-02"))       ## SUBSETTING DATA BY DATE.  
                                                                                ## QUICK AND DIRTY TIDY DATA SET!!!
png(file = "plot1.png")                                                         ## OPEN DEVICE
##
##      *****CREATING PLOT1*****
##
##      HISTOGRAM
##
with(mydata, hist(Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)"))
##
dev.off()                                                                       ## CLOSE GRAPHICS DEVICE.
##
##      *****END OF SCRIPT*****








