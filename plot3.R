## House hold power consumption data ##
 library(data.table)

Housepower <- fread("household_power_consumption.txt")
Housepower$Date <- as.Date(Housepower$Date, format="%d/%m/%Y")


## Filtered only the specific dates - 2007-02-01 and 2007-02-02 in excel ##

Housepower2 <- subset(Housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Housepower)

##Plot3 ##



Housepower2 <- transform(Housepower2, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

Housepower2$Sub_metering_1 <- as.numeric(as.character(Housepower2$Sub_metering_1))
Housepower2$Sub_metering_2 <- as.numeric(as.character(Housepower2$Sub_metering_2))
Housepower2$Sub_metering_3 <- as.numeric(as.character(Housepower2$Sub_metering_3))
plot(Housepower2$timestamp,Housepower2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Housepower2$timestamp,Housepower2$Sub_metering_2,col="red")
lines(Housepower2$timestamp,Housepower2$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

## Copy to png ##

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
dev.cur()