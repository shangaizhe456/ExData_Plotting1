data <- read.csv2("household_power_consumption.txt")
dt <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

dt[,2] = as.character(dt[,2])
for(i in 3:9) dt[,i] = as.numeric(as.character(dt[,i]))
dt[,1] <- as.character(gl(2,1440,labels=c("2007-02-01","2007-02-02")))

dt$datetime <- paste(dt[,1],dt[,2])

Sys.setlocale(locale = "C")
plot(as.POSIXct(strptime(dt$datetime, "%Y-%m-%d %H:%M:%S")), dt$Global_active_power,type = "l",
     xlab=" ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png")

dev.off()
