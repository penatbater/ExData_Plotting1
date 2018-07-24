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

##Plot3

png(filename = "plot3.png")
plot(DT$Date_Time, DT$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DT$Date_Time, DT$Sub_metering_2, type = "l", col = "red")
lines(DT$Date_Time, DT$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()

