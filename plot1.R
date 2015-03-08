data <- read.csv("household_power_consumption.txt", sep = ";", strip.white = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- strptime(data$Date, "%Y-%m-%d")
data2 <- subset(data, (Date == "2007-02-01" | Date == "2007-02-02"))
class(data2$Global_active_power) <- "numeric"


hist(data2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", ylim = c(1,1200), xlim = c(1, 6))


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
