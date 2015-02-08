setwd("/Users/carloscrespo/Documents/dataScience/exploratoryDA")
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./data",method="curl")
unzip("./data")

file <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
filteredfile <- file[as.Date(file[,"Date"],format="%d/%m/%Y") >= as.Date(c("01/02/2007"), format="%d/%m/%Y") & as.Date(file[,"Date"],format="%d/%m/%Y") <= as.Date(c("02/02/2007"), format="%d/%m/%Y"),]

png(filename = "plot1.png", width = 480, height = 480)
hist(filteredfile$Global_active_power, breaks=seq(0,12,by=0.5), xlab = "Global Active Power (kilowatts)", xlim=c(0,6), labels=seq(0,6,2), xaxt="n", yaxt="n", col="red", main="Global Active Power")
axis(side=1,at=seq(0,6,2))
axis(side=2,at=seq(0,1200,300))
dev.off()

