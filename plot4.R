## House hold power consumption data ##
 library(data.table)

Housepower <- fread("household_power_consumption.txt")
Housepower$Date <- as.Date(Housepower$Date, format="%d/%m/%Y")


## Filtered only the specific dates - 2007-02-01 and 2007-02-02 in excel ##

Housepower2 <- subset(Housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Housepower)





Housepower2 <- transform(Housepower2, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

Housepower2$Global_active_power <- as.numeric(as.character(Housepower2$Global_active_power))
Housepower2$Global_reactive_power <- as.numeric(as.character(Housepower2$Global_reactive_power))
Housepower2$Voltage <- as.numeric(as.character(Housepower2$Voltage))
Housepower2$Sub_metering_1 <- as.numeric(as.character(Housepower2$Sub_metering_1))
Housepower2$Sub_metering_2 <- as.numeric(as.character(Housepower2$Sub_metering_2))
Housepower2$Sub_metering_3 <- as.numeric(as.character(Housepower2$Sub_metering_3))

##Plot4 ##


par(mfcol=c(2,2))

##1
plot(Housepower2$timestamp,Housepower2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

##2


plot(Housepower2$timestamp,Housepower2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Housepower2$timestamp,Housepower2$Sub_metering_2,col="red")
lines(Housepower2$timestamp,Housepower2$Sub_metering_3,col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

##3

plot(Housepower2$timestamp,Housepower2$Voltage, type="l", xlab="datetime", ylab="Voltage")

##4
plot(Housepower2$timestamp,Housepower2$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Copy to png ##

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
dev.cur()