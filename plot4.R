data <- read.csv("household_power_consumption.txt", sep = ";", strip.white = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- strptime(data$Date, "%Y-%m-%d")
data2 <- subset(data, (Date == "2007-02-01" | Date == "2007-02-02"))
class(data2$Global_active_power) <- "numeric"
class(data2$Sub_metering_1) <- "numeric"
class(data2$Sub_metering_2) <- "numeric"
class(data2$Sub_metering_3) <- "numeric"
class(data2$Voltage) <- "numeric"
class(data2$Global_reactive_power) <- "numeric"

datetime <- paste(as.Date(data$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data2, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global_reactive_power",xlab="")
})

## Saving to file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



