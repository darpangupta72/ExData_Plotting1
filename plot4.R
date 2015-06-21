#Default width and height = 480 each
png(file = "plot4.png")

#Reading and processing the data(reading as and converting to apt formats)
a <- read.csv2("household_power_consumption.txt", colClasses = rep("character", 7))
for(i in 3:9)
        a[, i] <- as.numeric(a[, i])
a <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]
a$Time <- strptime(paste(a$Time, a$Date), "%H:%M:%S %d/%m/%Y")

#For 2 rows and 2 columns, plotting row-wise
par(mfrow = c(2,2))

#plot 1
plot(x = a$Time, y = a$Global_active_power, type = "l", xlab = " ", 
     ylab = "Global Active Power")

#plot 2
plot(x = a$Time, y = a$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3
plot(y = a$Sub_metering_1, x = a$Time, type = "l", xlab = " ", 
     ylab = "Energy sub metering")
lines(y = a$Sub_metering_2, x = a$Time, col = "red")
lines(y = a$Sub_metering_3, x = a$Time, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), bty = "n", lty = 1)

#plot 4
plot(x = a$Time, y = a$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

#closing the graphics device
dev.off()