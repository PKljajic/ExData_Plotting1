
#elcon is a table - electrical power consumption for dates 1/2/2007 and 2/2/2007
elcon <- read.table("household_power_consumption.txt", stringsAsFactors = F, 
                    na.strings = "?", sep = ";", skip = 66637, nrows = 2880)

#assigning header to table elcon
namesOf <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
             "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
names(elcon) <- namesOf

#ploting histogram, coloring stripes in red and assigning label for x axis and main title
hist(elcon$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active power")

#exporting plot to png file and closing graphics device
dev.copy(png, "plot1.png")
dev.off()