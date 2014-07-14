## Reading the data
dados<-read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.string="?")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
dados2<-dados[with(dados, Date=="1/2/2007"|Date=="2/2/2007"), ]

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
png(file="plot1.png")
hist(dados2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()