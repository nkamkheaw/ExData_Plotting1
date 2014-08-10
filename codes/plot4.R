#get data
table_names <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=1)
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880)
names(data) <- names(table_names)
rm(table_names)
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- data[2:9]
colnames(data)[1] <- "Date_Time"

#create png device
png(filename = 'plot4.png', width = 480, height = 480, units = 'px')

par(mfrow = c(2, 2), mar = c(4, 4, 2, 2), oma = c(4, 0, 2, 0))
#plot data
with(data$Date_Time, {
    #1
    plot(data$Date_Time,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")
    
    #2
    plot(data$Date_Time,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
    
    #3
    plot(data$Date_Time,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col="black")
    lines(data$Date_Time,data$Sub_metering_2,col="red")
    lines(data$Date_Time,data$Sub_metering_3,col="blue")
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, bty = "n")
    
    #4
    plot(data$Date_Time,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})

#close device
dev.off()