# Dataload
mydata <- read.table("household_power_consumption.txt", header = TRUE,
			sep = ";", na.strings = "?")

# Transform and subset
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
mydata$datetime <- as.POSIXct(mydata$datetime)
plot(mydata$Sub_metering_1 ~ mydata$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(mydata$Sub_metering_2 ~ mydata$datetime, col = "Red")
lines(mydata$Sub_metering_3 ~ mydata$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()