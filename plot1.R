downloadURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

download.file(downloadURL, 'powerConsumption.zip')

powerDataFrame <- read.csv(unz('powerConsumption.zip', 'household_power_consumption.txt'), sep=';', na.strings='?', colClasses=c('Date', 'character', rep('numeric', 7)))

subsetDF <- subset(powerDataFrame, Date >= '01/02/2007' && Date >= '02/02/2007')

hist(subsetDF$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.copy(png, file='plot1.png')

dev.off()