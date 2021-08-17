# read in and process data
setwd('ExData_Plotting1')
data <- read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), 
	header=T, sep=";")
s <- subset(data, Date=='1/2/2007' | Date == '2/2/2007')
s$date <- as.Date(s$Date, "%d/%m/%Y")
s$datetime <- strptime(paste(s$Date,s$Time), "%d/%m/%Y %H:%M:%S")
s[,3:8] <- sapply(s[,3:8], as.numeric)
library(Hmisc)
label(s$Global_active_power) <- 'Global Active Power (kilowatts)'

# plot 1
png("Rplot1.png",width = 480, height = 480)
hist(s$Global_active_power, col='red',xlab=label(s$Global_active_power), main='Global Active Power')
dev.off()

