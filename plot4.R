
#elcon is a table - electrical power consumption for dates 1/2/2007 and 2/2/2007
elcon <- read.table("household_power_consumption.txt", stringsAsFactors = F, 
                    na.strings = "?", sep = ";", skip = 66637, nrows = 2880)

#assigning header to table elcon
namesOf <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
             "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(elcon) <- namesOf

#prepairing screen for 4 graphs
par(mfcol = c(2, 2))

#plotting plot1 (upper left)
x <- 1:length(elcon$Global_active_power)
plot(x, elcon$Global_active_power, type = "l", xaxt = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)");
at <- seq(1, max(x) + 1, max(x)/2)
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

#plotting plot2 (lower left)
plot(x, elcon$Sub_metering_1, type = "n", xaxt = "n", xlab = "", ylab = "Energy sub metering")
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))
lines(x, elcon$Sub_metering_1)
lines(x, elcon$Sub_metering_2, col = "red")
lines(x, elcon$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 2)

#plot datetime vs voltage (upper right)
plot(x, elcon$Voltage, xlab = "datetime", ylab = "Voltage", xaxt = "n", type = "l")
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

#plot datetime vs global reactive power (lower right)
plot(x, elcon$Global_reactive_power, xlab = "datetime", ylab = "Global Reactive Power", xaxt = "n", type = "l")
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

#exporting plot to png file and closing graphics device
dev.copy(png, "plot4.png")
dev.off()