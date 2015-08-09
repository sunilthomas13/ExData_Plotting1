## Read complete data from the given file
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subset data by filtering for given date range
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates into R Datetime class, and add as new column
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Generate Plot 3 and annotate lines and legents
plot(data$Sub_metering_1~data$Datetime, type="l",ylab="Energy sub metering", xlab="",,cex=0.5)

lines(data$Sub_metering_2~data$Datetime,col='Red')
lines(data$Sub_metering_3~data$Datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5)

## Open PNG Device, save to file plot2.png  and close device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()