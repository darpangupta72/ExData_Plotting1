#Default width and height = 480 each
png(file = "plot2.png")

#Reading and processing the data(reading as and converting to apt formats)
a <- read.csv2("household_power_consumption.txt", colClasses = rep("character", 7))
for(i in 3:9)
        a[, i] <- as.numeric(a[, i])
a <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]
a$Time <- strptime(paste(a$Time, a$Date), "%H:%M:%S %d/%m/%Y")

#Producing the reqd. plot
plot(x = a$Time, y = a$Global_active_power, type = "l", xlab = " ", 
     ylab = "Global Active Power (kilowatts)")

#closing the graphics device
dev.off()
