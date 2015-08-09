## Read complete data from the given file
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subset data by filtering for given date range
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates into R Datetime class, and add as new column
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Generate Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.5)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Reactive Power",xlab="")
})


## Open PNG Device, save to file plot2.png  and close device
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
