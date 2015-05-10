##Plot1 of the Electric power consumption data set

#Reads the data from your working directory
EPowerData<-read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".")

#Converts data types to work wtih histogram
EPowerData[,3]<-as.numeric(as.character(EPowerData[,3]))
EPowerData[,1]<-as.Date(EPowerData[,1],"%d/%m/%Y")

#limits data to specified dates
dates<-c("1/2/2007","2/2/2007")
dates<-as.Date(dates, "%d/%m/%Y")
GraphData<-EPowerData[EPowerData$Date%in%dates,]

#opens graphics device and creates png file. 
png(file="plot1.png")
hist(GraphData$Global_active_power, col="red1", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power",yaxp=c(0,1200,6))
dev.off()
