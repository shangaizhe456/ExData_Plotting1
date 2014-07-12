data <- read.csv2("household_power_consumption.txt")
dt <- data[data$Date == "1/2/2007"|data$Date == "2/2/2007",]

for(i in 3:9) dt[,i] = as.numeric(as.character(dt[,i]))

hist(dt$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()
