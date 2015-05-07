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

daterange=c(as.POSIXlt(min(data$DateTime)),as.POSIXlt(max(data$DateTime)))

plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", col="black", main="", type="l", xlab="", xaxt = "n")
axis.POSIXct(1, at=seq(daterange[1], as.POSIXlt(daterange[2] + 3600), by="days"), format="%a")


## Copy my plot to a PNG file
dev.copy(png, file = "plot2.png", width=480, height=480) 

## Don't forget to close the PNG device!
dev.off() 