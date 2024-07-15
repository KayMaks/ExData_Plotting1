data <- subset(read.table(file = "household_power_consumption.txt", sep = ";",
                          header = TRUE, stringsAsFactors = FALSE, na.strings =
                                  "?"),
               Date == "1/2/2007" | Date == "2/2/2007"
               )
dates <- data$Date
times <- data$Time
dt <- paste(dates, times)
data$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png("Plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.off()

