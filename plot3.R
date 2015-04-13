downloadURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(downloadURL, 'powerConsumption.zip')

powerDataFrame <- read.csv(unz('powerConsumption.zip', 'household_power_consumption.txt'), sep=';', na.strings='?', colClasses=c('Date', 'character', rep('numeric', 7)))

powerDataFrame$Datetime <- with(powerDataFrame, strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))

firstDay <- strptime('01/02/2007 00:00:00', format='%d/%m/%Y %H:%M:%S')
endDay <- strptime('03/02/2007 00:00:00', format='%d/%m/%Y %H:%M:%S')

subsetDF <- subset(powerDataFrame, Datetime >= firstDay && secondDay)

with(subsetDF, plot(Datetime, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering', col='black'))
with(subsetDF, lines(Datetime, Sub_metering_2, type='l', xlab='', col='red'))
with(subsetDF, lines(Datetime, Sub_metering_3, type='l', xlab='', col='blue'))
legend('topright', lwd=1, lty=1, cex=0.6, col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))


dev.copy(png, file='plot3.png')

dev.off()