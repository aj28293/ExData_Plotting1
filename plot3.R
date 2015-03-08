data <- read.csv("household_power_consumption.txt", sep = ";", strip.white = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- strptime(data$Date, "%Y-%m-%d")
data2 <- subset(data, (Date == "2007-02-01" | Date == "2007-02-02"))
class(data2$Global_active_power) <- "numeric"
class(data2$Sub_metering_1) <- "numeric"
class(data2$Sub_metering_2) <- "numeric"
class(data2$Sub_metering_3) <- "numeric"

datetime <- paste(as.Date(data$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

with(data2, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab ="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



