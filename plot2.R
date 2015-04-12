#plot2.R
data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date,"%d/%m/%Y")
#datatimef  <- strftime(datatime,format="",usetz=FALSE)
#data$Datetime <- paste(datatimef)
subdata <- data[data$Date >= "2007-02-01" & data$Date <="2007-02-02", ]
datatime <- strptime(paste(subdata$Date,subdata$Time),"%Y-%m-%d %H:%M:%S")
subdata$Datetime <- paste(datatime)
subdata[[10]] <- as.POSIXct(subdata[[10]])
subdata$day <- weekdays(subdata$Datetime)
plot(subdata$Datetime,subdata$Global_active_power,type="l",col="black",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file="plot2.png")
dev.off()
