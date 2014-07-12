data <- read.csv("../data/household_power_consumption.txt",sep=";",header=T, na.strings= c('?'))

format = "%d/%m/%Y"
data$Date <- as.Date(data$Date,format)

days <- c("2007-02-01","2007-02-02")
days <- as.Date(days,"%Y-%m-%d")

cdays <- data[data$Date == days[1] | data$Date == days[2],]
png("figure/plot1.png")
hist(cdays$Global_active_power,xlab="Global active power (kilowatts)",col=c("red"),
     main="Global Active Power")
dev.off()
