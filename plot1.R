## Read complete data from the given file
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subset data by filtering for given date range
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Generate Histogram (Plot 1)
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Open PNG Device, save to file plot1.png  and close device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

#End