## Read complete data from the given file
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subset data by filtering for given date range
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")
data <- subset(all_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates into R Datetime class, and add as new column
data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Genegrate plot (Plot2 )
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Open PNG Device, save to file plot2.png  and close device
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()