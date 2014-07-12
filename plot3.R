data <- read.csv2("household_power_consumption.txt")
dt <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

dt[,2] = as.character(dt[,2])
for(i in 3:9) dt[,i] = as.numeric(as.character(dt[,i]))
dt[,1] <- as.character(gl(2,1440,labels=c("2007-02-01","2007-02-02")))

dt$datetime <- paste(dt[,1],dt[,2])
dt$datetime <- as.POSIXct(strptime(dt$datetime, "%Y-%m-%d %H:%M:%S"))

Sys.setlocale(locale = "C")

png("plot3.png")
with(dt,plot(datetime,Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering"))
lines(dt$datetime,dt$Sub_metering_2,col = "red")
lines(dt$datetime,dt$Sub_metering_3,col = "blue")

legend("topright",lty = "solid",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
