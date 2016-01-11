## Exploratory Data Assignment 1 - Plot 4

## Load data into R; Only from dates 2007-02-01 until 2007-02-02


pwr_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", 
                                                                                                   "numeric","numeric","numeric", "numeric","numeric","numeric","numeric"), na.strings = "?", skip = 66636, nrows = 2880)

colnames(pwr_data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1",
                        "Sub_metering_2", "Sub_metering_3")

## Create a date time column of POSIXlt Class 
pwr_data$Date_Time <- paste(pwr_data$Date, pwr_data$Time, sep = " ")
pwr_data$Date_Time <- strptime(pwr_data$Date_Time, format = "%d/%m/%Y %H:%M:%S")

## create plot 

par(mfrow = c(2,2), mar = c(4,4,2,1))

with(pwr_data, {
    plot(Date_Time, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", pch = ".")
        lines(Date_Time, Global_active_power, type ="l")
    
    plot(Date_Time, Voltage, ylab = "Voltage", xlab = "datetime", pch = ".")
        lines(Date_Time, Voltage, type = "l")
    
    plot(Date_Time, Sub_metering_1, pch =".", col="purple", ylab = "Energy sub metering", xlab = "",  type = "n") 
            lines(Date_Time, Sub_metering_1, type = "l", col="purple")
        points(Date_Time, Sub_metering_2, pch =".", col="red")
            lines(Date_Time, Sub_metering_2, type = "l", col="red")
        points(Date_Time, Sub_metering_3, pch =".", col="blue")
            lines(Date_Time, Sub_metering_3, type = "l", col="blue")
        legend("topright", pch = "-", col = c("purple", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(Date_Time, Global_reactive_power, ylab = "Global Reactive Power", xlab = "datetime", pch = ".")
        lines(Date_Time, Global_reactive_power, type = "l")
    
})


