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
#png("plot2.png", width=480, height=480)

with(dataFiltered, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()