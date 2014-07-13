## First read data and convert Date
data<-read.table("household_power_consumption.txt",sep=";",header=T)
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Var for cut the selected days
control1<-as.Date("03/02/2007","%d/%m/%Y")
control2<-as.Date("31/01/2007","%d/%m/%Y")

## cut selected days
data2<-data[data$Date<control1,]
data3<-data2[data2$Date>control2,]

library(lubridate)
data$Date_Time<- paste(as.character(data$Date),as.character(data$Time),sep=" ")
data$Date_Time<-ymd_hms(data$Date_Time)

png(file="plot4.png", width=480, height=480)

## build the four parts of screen
par(mfrow=c(2,2))

## plot the four graphics

plot(data$Date_Time,data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(data$Date_Time,data$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(data$Date_Time,data$Sub_metering_1,xlab="",ylab="Energy sub metering", type="n")
points(data$Date_Time,as.double(as.character(data$Sub_metering_1)),type="l",col="black")
points(data$Date_Time,as.double(as.character(data$Sub_metering_2)),type="l",col="red")
points(data$Date_Time,as.double(as.character(data$Sub_metering_3)),type="l",col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", inset = .05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

plot(data$Date_Time,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()