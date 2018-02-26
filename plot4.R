# Exploratory Data Analysis Assignment 1
# Roxanne S. Avinante
# DOST-ASTI
# Feb 26, 2018

# Plot 4

library(data.table)
rm(list = ls())
setwd("C:/Data_Science/Exploratory_Data_Analysis")

data <- read.table("data/household_power_consumption.txt"
                   , header = T
                   , sep = ";"
                   , na.strings = "?"
                   )

# 1. Convert data variable to Date class
# 2. Subset dates between 2007-02-01 and 2007-02-02
# 3. Convert date and time format 
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

data$datetime <- as.POSIXct(data$datetime)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Plot 1
plot(data$Global_active_power ~ data$datetime
     , type = "l" 
     , xlab = ""
     , ylab = "Global Active Power"
     )
# Plot 2
plot(data$Voltage ~ data$datetime
     , type = "l"
     , xlab = "datetime"
     , ylab = "Voltage")

# Plot 3
plot(data$Sub_metering_1 ~ data$datetime
     , type = "l"
     , ylab = "Energy sub metering"
     , xlab = ""
     )
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright" 
       , col = c("black", "red", "blue")
       , cex = 0.8
       , lty = 1
       , lwd = 2
       , bty = "n"
       , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

# Plot 4
plot(data$Global_reactive_power ~ data$datetime
     , type = "l"
     , xlab = "Global_reactive_power"
     , ylab = "datetime"
     )

# Save file
dev.copy(png
         , file = "plot4.png"
         , height = 480
         , width = 480
         )
dev.off()
