library(dplyr)

## load data
data <- read.csv("household_power_consumption.txt", sep=";", na.string="?")

## transform data
data <- mutate(data, DateTime = paste(data$Date, data$Time, sep=" "))
data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))


## filter only to the given date range
data <- filter(data, (Date >= '2007-02-01' & Date <= '2007-02-02'))

## create DateTime column
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S") 

## Draw a new plot

png("plot3.png", width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", col="black", main="", type="l", xlab="", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", cex = 0.75, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
daterange=c(as.POSIXlt(min(data$DateTime)),as.POSIXlt(max(data$DateTime)))
axis.POSIXct(1, at=seq(daterange[1], as.POSIXlt(daterange[2] + 3600), by="days"), format="%a")

## Don't forget to close the PNG device!
dev.off() 