#### Plot 2 ####
png(file="./plot2.png")

par(bg = "transparent")

plot(newtime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()