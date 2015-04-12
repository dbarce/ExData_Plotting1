#plot1.r
data <- read.csv("household_power_consumption.txt", sep=";",na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$Date <- as.Date(data$Date,"%d/%m/%Y")
#datatime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
#datatimef  <- strftime(datatime,format="",usetz=FALSE)
#data$Datetime <- paste(datatimef)
subdata <- data[data$Date >= "2007-02-01" & data$Date <="2007-02-02", ]
hist(subdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()
