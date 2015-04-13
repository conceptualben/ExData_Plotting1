downloadURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(downloadURL, 'powerConsumption.zip')

powerDataFrame <- read.csv(unz('powerConsumption.zip', 'household_power_consumption.txt'), sep=';', na.strings='?', colClasses=c('Date', 'character', rep('numeric', 7)))

powerDataFrame$Datetime <- with(powerDataFrame, strptime(paste(Date, Time), format='%d/%m/%Y %H:%M:%S'))

firstDay <- strptime('01/02/2007 00:00:00', format='%d/%m/%Y %H:%M:%S')
endDay <- strptime('03/02/2007 00:00:00', format='%d/%m/%Y %H:%M:%S')

subsetDF <- subset(powerDataFrame, Datetime >= firstDay && secondDay)


with(subsetDF, plot(Datetime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'))

dev.copy(png, file='plot2.png')

dev.off()