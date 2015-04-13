downloadURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(downloadURL, 'powerConsumption.zip')

powerDataFrame <- read.csv(unz('powerConsumption.zip', 'household_power_consumption.txt'), sep=';', na.strings='?', colClasses=c('Date', 'character', rep('numeric', 7)))

powerDataFrame$Datetime <- with(powerDataFrame, strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))

firstDay <- strptime('01/02/2007 00:00:00', format='%d/%m/%Y %H:%M:%S')
endDay <- strptime('03/02/2007 00:00:00', format='%d/%m/%Y %H:%M:%S')

subsetDF <- subset(powerDataFrame, Datetime >= firstDay && secondDay)

par(mfrow=c(2, 2), mar=c(4, 5, 2, 1), cex=0.8)

with(subsetDF, {
  plot(Datetime, Global_active_power, type='l', ylab='Global Active Power', xlab='')
  plot(Datetime, Voltage, type='l', xlab='datetime')
  plot(Datetime, Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
  lines(Datetime, Sub_metering_2, type='l', xlab='', col='red')
  lines(Datetime, Sub_metering_3, type='l', xlab='', col='blue')
  legend('topright', lwd=1, lty=1, cex=0.6, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot(Datetime, Global_reactive_power, type='l', xlab='datetime')
})

dev.copy(png, file='plot4.png')

dev.off()