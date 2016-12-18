setwd("C:/Users/Brad/Documents/coursera eda/assignment_1")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
sub_dates <- subset(household_power_consumption, subset = Date %in% c("1/2/2007", "2/2/2007"))
sub_dates$x <- strptime(paste(sub_dates$Date, sub_dates$Time), "%d/%m/%Y %H:%M:%S")
png(file = "plot4.png")
par(mfrow = (c(2,2)), mar = c(5,4,2,1))
#1
plot(sub_dates$x, sub_dates$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
#2
plot(sub_dates$x, sub_dates$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
#3
with(sub_dates, plot(x,Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l"))
with(sub_dates, lines(x,Sub_metering_2,col = "red", type = "l"),ylab = "")
with(sub_dates, lines(x,Sub_metering_3,col = "blue", type = "l"))
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(sub_dates$x, sub_dates$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
dev.off()