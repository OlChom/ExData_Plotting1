# Dataload
mydata <- read.table("household_power_consumption.txt", header = TRUE,
			sep = ";", na.strings = "?")

# Transform and subset
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

# Plot 2
mydata$datetime <- as.POSIXct(mydata$datetime)
plot(mydata$Global_active_power ~ mydata$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
