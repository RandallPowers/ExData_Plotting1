#First we load and clean the data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

## Filter data set from Feb. 1, 2007 to Feb. 2, 2007, we want two days of data
data <- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

## Keep only complete obsercations
data <- data[complete.cases(t),]

## Combine Date and Time columns
dateTime <- paste(data$Date, data$Time)

## Name the vector
dateTime <- setNames(dateTime, "DateTime")

## Remove Date and Time column
data <- data[ ,!(names(data) %in% c("Date","Time"))]

## Add DateTime column
data <- cbind(dateTime, data)

## Format dateTime Column
data$dateTime <- as.POSIXct(dateTime)

dev.copy(png, file="plot1.png", height=480, width=480)

## Create plot1.png
hist(data$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

dev.off