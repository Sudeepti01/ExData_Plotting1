## House hold power consumption data ##
 library(data.table)

Housepower <- fread("household_power_consumption.txt")
Housepower$Date <- as.Date(Housepower$Date, format="%d/%m/%Y")


## Filtered only the specific dates - 2007-02-01 and 2007-02-02 in excel ##

Housepower2 <- subset(Housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Housepower)

##Plot2 ##



Housepower2 <- transform(Housepower2, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

Housepower2$Global_active_power <- as.numeric(as.character(Housepower2$Global_active_power))

plot(Housepower2$Global_active_power, Housepower2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")



## Copy to png ##

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
dev.cur()