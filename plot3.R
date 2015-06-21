#Default width and height = 480 each
png(file = "plot3.png")

#Reading and processing the data(reading as and converting to apt formats)
a <- read.csv2("household_power_consumption.txt", colClasses = rep("character", 7))
for(i in 3:9)
        a[, i] <- as.numeric(a[, i])
a <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]
a$Time <- strptime(paste(a$Time, a$Date), "%H:%M:%S %d/%m/%Y")

#Producing the reqd. plot
plot(y = a$Sub_metering_1, x = a$Time, type = "l", xlab = " ", 
     ylab = "Energy sub metering")
lines(y = a$Sub_metering_2, x = a$Time, col = "red")
lines(y = a$Sub_metering_3, x = a$Time, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

#closing the graphics device
dev.off()