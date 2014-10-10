#### Reading the Data into R ####

#We are just interested in days 1.2.2007 and 2.2.2007 hence we first take a 
#look at the data.

x<-read.table("household_power_consumption.txt", nrows = 2, sep = ";")

# To get to the date we want we will substract it from the date and time of the
# first data-point.

firstdate<-as.character(x[2,1])
firsttime<-as.character(x[2,2])
first<-paste(firstdate,firsttime, sep="")
first<-strptime(first, "%d/%m/%Y %T") #turn the date from character to POSIX

start<-strptime("1/2/2007", "%d/%m/%Y") #the first date we are interested

skip<-difftime(start, first, unit ="mins")
nrows<-48*60 # we want to look at data from to days and the datapoints are
             # listed by minute; hence 48*60

data<-read.table("household_power_consumption.txt", header= TRUE, sep= ";", 
    na.strings = "?", colClasses = c("character", "character", "numeric", 
    "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), 
    skip=skip, nrows=nrows, col.names= c("Date", "Time", "Global_active_power",
    "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
    "Sub_metering_2", "Sub_metering_3"))
# Though we are setting header to TRUE the header itself will be cut off by the
# skip parameter so it's important to give cols their names by hand.

##### Pre-processing the data #####

# The biggest problem with the data is that time is split into to variables and
# is a character class. Let's fix that.

newtime<-paste(data$Date, data$Time)
newtime<-as.POSIXct(newtime, format ="%d/%m/%Y %T")

#### Plot 1 ####

hist(data$Global_active_power, title = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

#### Plot 2 ####

plot(newtime, data$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

#### Plot 3 ####

par(cex = 0.5)

plot(newtime, data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering")
lines(newtime, data$Sub_metering_1, col="black")
lines(newtime, data$Sub_metering_2, col="red")
lines(newtime, data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(1,1,1))

#### Plot 4 ####

par(mfrow = c(2, 2), mar = c(1.25, 1.25, 1.25, 1.25), cex = 0.5)

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
       col = c("black", "red", "blue"), lty = c(1,1,1), lwd = c(1,1,1))

plot(newtime, data$Global_active_power, type = "l", xlab = "datetime", 
     ylab = "Global reactive Power (kilowatts)")