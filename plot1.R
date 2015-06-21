#Default width and height = 480 each
png(file = "plot1.png")

#Reading and processing the data(reading as and converting to apt formats)
a <- read.csv2("household_power_consumption.txt", colClasses = rep("character", 7))
for(i in 3:9)
        a[, i] <- as.numeric(a[, i])
a <- a[a$Date == "1/2/2007" | a$Date == "2/2/2007", ]

#Producing the reqd. plot
hist(a$Global_active_power, col = "red", xlab = 
             "Global Active Power (kilowatts)", main = "Global Active Power")

#closing the graphics device
dev.off()