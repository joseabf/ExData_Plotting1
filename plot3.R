## First read data and convert Date
data<-read.table("household_power_consumption.txt",sep=";",header=T)
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Var for cut the selected days
control1<-as.Date("03/02/2007","%d/%m/%Y")
control2<-as.Date("31/01/2007","%d/%m/%Y")

# cut selected days
data2<-data[data$Date<control1,]
data3<-data2[data2$Date>control2,]

## join date and time in a new column Date_Time
library(lubridate)
data3$Date_Time<- paste(as.character(data3$Date),as.character(data3$Time),sep=" ")
data3$Date_Time<-ymd_hms(data3$Date_Time)

data<-data3

## plot and write to file (you don't see it in screen)
png(file="plot3.png", width=480, height=480)
plot(data$Date_Time,data$Sub_metering_1,xlab="",ylab="Energy sub metering", type="n")
points(data$Date_Time,as.double(as.character(data$Sub_metering_1)),type="l",col="black")
points(data$Date_Time,as.double(as.character(data$Sub_metering_2)),type="l",col="red")
points(data$Date_Time,as.double(as.character(data$Sub_metering_3)),type="l",col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", inset = .05, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()