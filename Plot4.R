
## Plot4.R

# Read in data file
power <- read.table("household_power_consumption.txt", 
                    header = TRUE,
                    sep = ";", 
                    na.strings = "?")
# Change Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
power2 <- subset(power, Date == "2007-02-01" | Date == "2007-02-02")
# Create DateTime parameters from "Date" and "Time"
dates <- power2$Date
times <- power2$Time
dt <- strptime(paste(dates, times, sep = " "), format = "%Y-%m-%d %H:%M:%S")
# Create plot & save it to a png file
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(dt, 
     power2$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")
plot(dt, 
     power2$Sub_metering_1, 
     type = "l", 
     col = "black", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(dt, 
      power2$Sub_metering_2, 
      col = "red")
lines(dt, 
      power2$Sub_metering_3, 
      col = "blue")
legend("topright", 
       lwd = 1,  
       col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
plot(dt, 
     power2$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")
plot(dt, 
     power2$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()