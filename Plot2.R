
## Plot2.R

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
png("plot2.png", width = 480, height = 480)
plot(dt, 
     power2$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)
dev.off()