#### Plot 1 ####
png(file="./plot1.png")

par(bg = "transparent")

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()