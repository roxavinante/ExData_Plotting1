# Exploratory Data Analysis Assignment 1
# Roxanne S. Avinante
# DOST-ASTI
# Feb 26, 2018

# Plot 2

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

# Plot 2
data$datetime <- as.POSIXct(data$datetime)

plot(data$Global_active_power ~ data$datetime
     , type = "l"
     , xlab = ""
     , ylab = "Global Active Power (kilowatts)"
     )

# Save file
dev.copy(png
         , file = "plot2.png"
         , height = 480
         , width = 480
         )
dev.off()