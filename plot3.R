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
#png("plot3.png", width=480, height=480)

with(dataFiltered, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)

dev.off()