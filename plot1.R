data <- read.csv("household_power_consumption.txt", sep = ";", strip.white = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Date <- strptime(data$Date, "%Y-%m-%d")
data2 <- subset(data, (Date == "2007-02-01" | Date == "2007-02-02"))
class(data2$Global_active_power) <- "numeric"

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")
data2$Global_active_power <- (data2$Global_active_power / 1000)

hist(data2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", breaks = 12, ylim = c(1,1200))


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
