## First read data and convert Date
data<-read.table("household_power_consumption.txt",sep=";",header=T)
data$Date<-as.Date(data$Date,"%d/%m/%Y")


control1<-as.Date("03/02/2007","%d/%m/%Y")
control2<-as.Date("31/01/2007","%d/%m/%Y")

data2<-data[data$Date<control1,]
data3<-data2[data2$Date>control2,]

## join date and time in a new column Date_Time
library(lubridate)
data3$Date_Time<- paste(as.character(data3$Date),as.character(data3$Time),sep=" ")
data3$Date_Time<-ymd_hms(data3$Date_Time)


## plot and write to file (you don't see it in screen)
png(file="plot2.png", width=480, height=480)
plot(data3$Date_Time,data3$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()