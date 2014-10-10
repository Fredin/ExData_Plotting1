#### Plot 4 ####
png(file="./plot4.png")

par(mfrow = c(2, 2), mar = c(6, 5, 1.25, 1.25), bg = "transparent")

plot(newtime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", )

plot(newtime, data$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

plot(newtime, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(newtime, data$Sub_metering_1, col="black")
lines(newtime, data$Sub_metering_2, col="red")
lines(newtime, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(1,1,1), bty = "n")

plot(newtime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global reactive Power (kilowatts)")

dev.off()