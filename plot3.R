
#elcon is a table - electrical power consumption for dates 1/2/2007 and 2/2/2007
elcon <- read.table("household_power_consumption.txt", stringsAsFactors = F, 
                    na.strings = "?", sep = ";", skip = 66637, nrows = 2880)

#assigning header to table elcon
namesOf <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
             "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(elcon) <- namesOf

#x represents time intervals
x <- 1:length(elcon$Sub_metering_1)

#ploting empty graph
plot(x, elcon$Sub_metering_1, type = "n", xaxt = "n", xlab = "", ylab = "Energy sub metering")

#creating custom ticks on x axis with tick labels representing days
at <- seq(1, max(x) + 1, max(x/2))
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

#adding lines representing certain Sub_metereng with different colors
lines(x, elcon$Sub_metering_1)
lines(x, elcon$Sub_metering_2, col = "red")
lines(x, elcon$Sub_metering_3, col = "blue")

#adding legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 2)

#exporting plot to png file and closing graphics device
dev.copy(png, "plot3.png")
dev.off()
