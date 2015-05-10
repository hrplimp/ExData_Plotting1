##Plot2 of the Electric power consumption data set

#Reads the data from your working directory
EPowerData<-read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

#Converts data types to work wtih histogram
EPowerData[,3]<-as.numeric(as.character(EPowerData[,3]))
datetime<-as.POSIXct(paste(EPowerData$Date, EPowerData$Time), format="%d/%m/%Y %H:%M:%S")
EPowerData[,"datetime"]<- datetime
EPowerData[,1]<-as.Date(EPowerData[,1],"%d/%m/%Y")


#limits data to specified dates
dates<-c("1/2/2007","2/2/2007")
dates<-as.Date(dates, "%d/%m/%Y")
GraphData<-EPowerData[EPowerData$Date%in%dates,]


#opens graphics device and creates png file. 
png(file="plot2.png")
with(GraphData, plot(datetime,Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab = ""))
dev.off()
