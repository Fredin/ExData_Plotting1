#### Plot 3 ####

png(file="./plot3.png")

par(bg = "transparent")

plot(newtime, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(newtime, data$Sub_metering_1, col="black")
lines(newtime, data$Sub_metering_2, col="red")
lines(newtime, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(1,1,1))

dev.off()