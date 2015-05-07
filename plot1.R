library(dplyr)

## load data
data <- read.csv("household_power_consumption.txt", sep=";", na.string="?")

## transform data
data <- mutate(data, Date = as.Date(Date, "%d/%m/%Y"))


## filter only to the given date range
data <- filter(data, (Date >= '2007-02-01' & Date <= '2007-02-02'))


## Draw a new plot
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

