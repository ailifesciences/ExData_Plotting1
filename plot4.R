#Reading the data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1 <- as.data.frame(data)
str(data1)

#Filtering data
dataFiltered <- subset(data1, data1$Date =="1/2/2007" | data1$Date =="2/2/2007")

#Formatting the date
dataFiltered$Date <- as.Date(dataFiltered$Date, format="%d/%m/%Y")

#Creating datetime
datetime <- paste(dataFiltered$Date, dataFiltered$Time)
dataFiltered$datetime <- as.POSIXct(datetime)

#Plotting data
#png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(dataFiltered, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=c(1,1), bty="n", cex=0.5,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()