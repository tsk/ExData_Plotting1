data <- read.csv("../data/household_power_consumption.txt",sep=";",header=T, na.strings= c('?'))

format = "%d/%m/%Y %H:%M:%S"
DateTime <- strptime(paste(data$Date,data$Time),format)
head(DateTime)
data2<- cbind(data,DateTime)
data2$DateTime
head(data2$Date)
data2$Date <- as.Date(data2$Date,"%d/%m/%Y")
head(data2)
days <- c("2007-02-01","2007-02-02")
days <- as.Date(days,"%Y-%m-%d")

cdays <- data2[data2$Date == days[1] | data2$Date == days[2],]
png("figure/plot3.png")
with(cdays,plot(DateTime,Sub_metering_1,type='l',xlab="",ylab="Energy sub metering"),legend)
with(cdays,lines(DateTime,Sub_metering_2,col="red"))
with(cdays, lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",lty="solid", col=c('black','red','blue'),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
