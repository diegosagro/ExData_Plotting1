## Reading the data
dados<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
dados2<-dados[with(dados, Date=="1/2/2007"|Date=="2/2/2007"), ]

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
dateTime <- strptime( paste(dados2$Date,dados2$Time), format="%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))
with(dados2, plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(dados2, plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(dados2, plot(dateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(dateTime, dados2$Sub_metering_2,col="red", type="l")
lines(dateTime, dados2$Sub_metering_3,col="blue", type="l")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col =c("black","red","blue"), lty="solid", bty="n")
with(dados2, plot(dateTime,  Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()

