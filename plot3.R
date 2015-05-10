##Plot3 of the Electric power consumption data set

#Reads the data from your working directory
EPowerData<-read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

#Converts data types to work wtih histogram
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
png(file="plot3.png")
with(GraphData, plot(datetime,Sub_metering_1, type="l",ylab="Energy sub metering", xlab = ""))
lines(GraphData$datetime, GraphData$Sub_metering_2, col="red")
lines(GraphData$datetime, GraphData$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","blue","red"),lty=1)
dev.off()
