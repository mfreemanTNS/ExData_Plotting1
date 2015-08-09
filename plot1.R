courseprojectdata <- function (x = "household_power_consumption.txt") {
  power <- read.table(x, sep = ";",header = TRUE, stringsAsFactors = FALSE, na.strings = "?")
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  power <- power[power$Date >= as.Date("2007-02-01") & power$Date <= as.Date("2007-02-02"),]
  power$Time <- strptime(power$Time, format = "%H:%M:%S")
  power$Global_active_power <- as.numeric(power$Global_active_power, na.rm=TRUE)
  power$Global_reactive_power <- as.numeric(power$Global_reactive_power, na.rm=TRUE)
  power$Voltage <- as.numeric(power$Voltage, na.rm=TRUE)
  power$Global_intensity <- as.numeric(power$Global_intensity, na.rm=TRUE)
  power$Sub_metering_1 <- as.numeric(power$Sub_metering_1, na.rm=TRUE)
  power$Sub_metering_2 <- as.numeric(power$Sub_metering_2, na.rm=TRUE)
  power$Sub_metering_3 <- as.numeric(power$Sub_metering_3, na.rm=TRUE)
  power
}

power <- courseprojectdata()

png("plot1.png", width = 480, height = 480, units = "px")
hist(power$Global_active_power, main = "Global Active Power", 
    xlab = "Global Active Power(kilowatts)", col = "red")
dev.off()
