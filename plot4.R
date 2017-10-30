# Dataload
mydata <- read.table("household_power_consumption.txt", header = TRUE,
			sep = ";", na.strings = "?")

# Transform and subset
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
mydata$datetime <- as.POSIXct(mydata$datetime)

par(mfrow = c(2, 2))
with (mydata, plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = ""))
with (mydata, plot(Voltage ~ datetime, type = "l"))
with (mydata, plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = ""))
with (mydata, lines(Sub_metering_2 ~ datetime, col = "Red"))
with (mydata, lines(Sub_metering_3 ~ datetime, col = "Blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

with (mydata, plot(Global_reactive_power ~ datetime, type = "l"))

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
