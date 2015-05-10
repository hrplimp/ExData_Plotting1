##Plot4 of the Electric power consumption data set

#Reads the data from your working directory
EPowerData<-read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

#Converts data types to work wtih histogram
EPowerData[,3]<-as.numeric(as.character(EPowerData[,3]))
EPowerData[,4]<-as.numeric(as.character(EPowerData[,4]))
EPowerData[,5]<-as.numeric(as.character(EPowerData[,5]))
EPowerData[,7]<-as.numeric(as.character(EPowerData[,7]))
EPowerData[,8]<-as.numeric(as.character(EPowerData[,8]))
#EPowerData[,9]<-as.numeric(as.character(EPowerData[,9]))
datetime<-as.POSIXct(paste(EPowerData$Date, EPowerData$Time), format="%d/%m/%Y %H:%M:%S")
EPowerData[,"datetime"]<- datetime
EPowerData[,1]<-as.Date(EPowerData[,1],"%d/%m/%Y")


#limits data to specified dates
dates<-c("1/2/2007","2/2/2007")
dates<-as.Date(dates, "%d/%m/%Y")
GraphData<-EPowerData[EPowerData$Date%in%dates,]


#opens graphics device and creates png file. 
png(file="plot4.png")
par(mfrow=c(2,2))
par(cex=0.6)
par(mar=c(4,4,2,1),oma=c(0,0,2,1))
with(GraphData, {
        plot(datetime,Global_active_power, type="l",ylab="Global Active Power", xlab = "")
        plot(datetime,Voltage, type="l",ylab="Voltage", xlab = "datetime")
        plot(datetime,Sub_metering_1, type="l",ylab="Energy sub metering", xlab = "")
                lines(GraphData$datetime, GraphData$Sub_metering_2, col="red")
                lines(GraphData$datetime, GraphData$Sub_metering_3, col="blue")
                legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","blue","red"),lty=1,bty="n")
        plot(datetime,Global_reactive_power, type="l", xlab = "datetime")
})
        
dev.off()
