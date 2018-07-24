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

##Plot1

png(filename = "plot1.png")

hist(z$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
