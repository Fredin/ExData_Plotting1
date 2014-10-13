#### Plot 1 ####

# To graph this plot you must run cleaningCodeProject.R first

png(file="./plot1.png")

par(bg = "transparent")

hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
