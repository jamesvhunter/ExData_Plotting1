## Exploratory Data Assignment 1 - Plot 1 

## Load data into R; Only from dates 2007-02-01 until 2007-02-02


pwr_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", 
                        "numeric","numeric","numeric", "numeric","numeric","numeric","numeric"), na.strings = "?", skip = 66636, nrows = 2880)

colnames(pwr_data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1",
                        "Sub_metering_2", "Sub_metering_3")

## convert Date column to Date class
pwr_data$Date <- as.Date(pwr_data$Date, format = "%d/%m/%Y")

## create plot 

hist(pwr_data$Global_active_power, main = "Global Active Power", col = "red3",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")