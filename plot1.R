# Plot 1
# Reading, naming and subsetting power consumption data
pow <- read.csv("household_power_consumption.txt", header = T, sep = ';')

# Initiating the device
png(file="plot1.png")

# Subsetting
names(pow) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
subpow <- subset(pow, pow$Date=="1/2/2007" |pow$Date =="2/2/2007")

# calling the basic plot function
hist(as.numeric(as.character(subpow$Global_active_power)), col= "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

# Closing the device
dev.off()
