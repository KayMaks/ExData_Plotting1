data <- subset(read.table(file = "household_power_consumption.txt", sep = ";",
                          header = TRUE, stringsAsFactors = FALSE, na.strings =
                                  "?"),
               Date == "1/2/2007" | Date == "2/2/2007"
)
dates <- data$Date
times <- data$Time
dt <- paste(dates, times)
data$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png("Plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering",
     xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
