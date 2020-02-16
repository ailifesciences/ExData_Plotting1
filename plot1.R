#Reading the data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data1 <- as.data.frame(data)
str(data1)

#Filtering data
dataFiltered <- subset(data1, data1$Date =="1/2/2007" | data1$Date =="2/2/2007")

#Formatting the date
dataFiltered$Date <- as.Date(dataFiltered$Date, format="%d/%m/%Y")

#Plotting data
png("plot1.png", width=480, height=480)

hist(dataFiltered$Global_active_power,col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")


dev.off()