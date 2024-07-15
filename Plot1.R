data <- subset(read.table(file = "household_power_consumption.txt", sep = ";",
                          header = TRUE, stringsAsFactors = FALSE, na.strings =
                          "?"),
               Date == "1/2/2007" | Date == "2/2/2007"
               )
dates <- data$Date
times <- data$Time
dt <- paste(dates, times)
data$DateTime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png("Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power
     (kilowatts)", main = "Global Active Power")
dev.off()