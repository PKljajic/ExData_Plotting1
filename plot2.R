
#elcon is a table - electrical power consumption for dates 1/2/2007 and 2/2/2007
elcon <- read.table("household_power_consumption.txt", stringsAsFactors = F, 
                    na.strings = "?", sep = ";", skip = 66637, nrows = 2880)

#assigning header to table elcon
namesOf <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
             "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(elcon) <- namesOf

#x represents time intervals
x <- 1:length(elcon$Global_active_power)

#ploting line type plot, but without ticks on x axis and without x label 
plot(x, elcon$Global_active_power, type = "l", xaxt = "n", xlab = "",
     ylab = "Global Active Power (kilowatts)");

#creating custom ticks on x axis with tick labels representing days
at <- seq(1, max(x) + 1, max(x)/2)
axis(side = 1, at = at, labels = c("Thu", "Fri", "Sat"))

#exporting plot to png file and closing graphics device
dev.copy(png, "plot2.png")
dev.off()
