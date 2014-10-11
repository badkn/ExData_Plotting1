## the file is downloaded unziped and saved in working directory 
## as "household_power_consumption.txt" 

## following code reads the downloaded data
mydata<- read.table("household_power_consumption.txt", header=T, sep=";")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

## creat data set for project
pdata<- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]
pdata$Global_active_power<- as.numeric(as.character(pdata$Global_active_power))
pdata$Global_reactive_power <- as.numeric(as.character(pdata$Global_reactive_power))
pdata$Voltage <- as.numeric(as.character(pdata$Voltage))
pdata$Sub_metering_1 <- as.numeric(as.character(pdata$Sub_metering_1))
pdata$Sub_metering_2 <- as.numeric(as.character(pdata$Sub_metering_2))
pdata$Sub_metering_3 <- as.numeric(as.character(pdata$Sub_metering_3))

## time stamping
pdata$timestamp <- strptime(paste(pdata$Date, pdata$Time), "%Y-%m-%d %H:%M:%S")


## PLOT 2

        plot(pdata$timestamp,pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot2.png", width=480, height=480)
        dev.off()
