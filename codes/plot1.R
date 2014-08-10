#get data
table_names <- read.table("household_power_consumption.txt", sep=";", header=TRUE, nrows=1)
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880)
names(data) <- names(table_names)
rm(table_names)
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- data[2:9]
colnames(data)[1] <- "Date_Time"

#create png device
png(filename = 'plot1.png', width = 480, height = 480, units = 'px')

#plot data
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#close device
dev.off()