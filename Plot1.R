## House hold power consumption data ##
 library(data.table)

Housepower <- fread("household_power_consumption.txt")
Housepower$Date <- as.Date(Housepower$Date, format="%d/%m/%Y")


## Filtered only the specific dates - 2007-02-01 and 2007-02-02 in excel ##

Housepower2 <- subset(Housepower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Housepower)

##Plot1 ##

#str(subSetData)
globalActivePower <- as.numeric(Housepower2$Global_active_power)

hist(globalActivePower, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copy to png ##

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
dev.cur()