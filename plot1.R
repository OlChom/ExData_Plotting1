# Dataload
mydata <- read.table("household_power_consumption.txt", header = TRUE,
			sep = ";", na.strings = "?")

# Transform and subset
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata <- subset(mydata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
mydata$datetime <- strptime(paste(mydata$Date, mydata$Time), "%Y-%m-%d %H:%M:%S")

# Plot1
hist(mydata$Global_active_power, col = "Red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)" )

# Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()