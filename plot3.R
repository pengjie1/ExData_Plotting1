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

# plot 3
png("Rplot3.png",width = 480, height = 480)
plot(s$datetime, s$Sub_metering_1  , ylab='Energy sub meeting', xlab='', type='n')
lines(s$datetime, s$Sub_metering_1, col='black')
lines(s$datetime, s$Sub_metering_2, col='red')
lines(s$datetime, s$Sub_metering_3, col='blue')
legend('topright',legend=colnames(s[,7:9]),col=c('black','red','blue'),lty=1)
dev.off()

