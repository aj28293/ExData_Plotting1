data <- read.csv("household_power_consumption.txt", sep = ";", strip.white = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- strptime(data$Date, "%Y-%m-%d")
data2 <- subset(data, (Date == "2007-02-01" | Date == "2007-02-02"))
class(data2$Global_active_power) <- "numeric"

datetime <- paste(as.Date(data$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

plot(data2$Global_active_power~data2$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

