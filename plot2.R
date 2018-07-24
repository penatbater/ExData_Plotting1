data<- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";")[grep("^[12]/2/2007", readLines("./data/household_power_consumption.txt")),]

## read table

data <- data[-nrow(data),]

## corrects the # of rows

data[,3:9] <- apply(data[,3:9], 2, function(x) as.numeric(as.character(x)))

## sets the other columns to numeric

library(tidyr)

DT <- unite(data, col = "Date_Time", 1:2, sep = " ")

DT$Date_Time <- strptime(DT$Date_Time, "%d/%m/%Y %H:%M:%S")


## sets the date factor

## Plot2

png(filename = "plot2.png")

plot(DT$Date_Time, DT$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
