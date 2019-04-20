# Plot 2
# Reading, naming and subsetting power consumption data
pow <- read.csv("household_power_consumption.txt", header = T, sep = ';')

# Initiating the device
png(file="plot2.png")

# Subsetting
names(pow) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subpow <- subset(pow, pow$Date=="1/2/2007" |pow$Date =="2/2/2007")

# Transforming the date and time vars from characters into objects of type date and POSIXlt respectively
subpow$Date <- as.Date(subpow$Date, format = "%d/%m/%Y")
subpow$Time <- strptime(subpow$Time, format = "%H:%M:%S")
subpow[1:1440, "Time"] <- format(subpow[1:1440, "Time"], "2007-02-01 %H:%M:%S")
subpow[1441:2880, "Time"] <- format(subpow[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# calling the basic plot function
plot(subpow$Time, as.numeric(as.character(subpow$Global_active_power)), type = "l", xlab="", ylab= "Global Active Power (kilowatts)")

# annotate graph
title(main = "Global Active Power Vs Time")

# Closing the device
dev.off()
