setwd("/Users/carloscrespo/Documents/dataScience/exploratoryDA")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./data",method="curl")
unzip("./data")

file <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
filteredfile <- file[as.Date(file[,"Date"],format="%d/%m/%Y") >= as.Date(c("01/02/2007"), format="%d/%m/%Y") & as.Date(file[,"Date"],format="%d/%m/%Y") <= as.Date(c("02/02/2007"), format="%d/%m/%Y"),]
filteredfile$Date <- strptime(paste(filteredfile$Date,filteredfile$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width = 480, height = 480)
plot(filteredfile$Date, filteredfile$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(filteredfile$Date, filteredfile$Sub_metering_2, col="red")
lines(filteredfile$Date, filteredfile$Sub_metering_3, col="blue")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1)
dev.off()