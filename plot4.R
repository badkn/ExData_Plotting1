## the file is downloaded unziped and saved in wd
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


## PLOT 4      

        par(mfrow=c(2,2))
        
        ##PLOT 1
        plot(pdata$timestamp,pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ##PLOT 2
        plot(pdata$timestamp,pdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 3
        plot(pdata$timestamp,pdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(pdata$timestamp,pdata$Sub_metering_2,col="red")
        lines(pdata$timestamp,pdata$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4
        plot(pdata$timestamp,pdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        #OUTPUT
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
        