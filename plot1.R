## First read data and convert Date

data<-read.table("household_power_consumption.txt",sep=";",header=T)
data$Date<-as.Date(data$Date,"%d/%m/%Y")

## Var for cut the selected days
control1<-as.Date("03/02/2007","%d/%m/%Y")
control2<-as.Date("31/01/2007","%d/%m/%Y")

# cut selected days
data2<-data[data$Date<control1,]
data3<-data2[data2$Date>control2,]

## plot and write to file (you don't see it in screen)
png(file="plot1.png", width=480, height=480)
hist(as.double(as.character(data3$Global_active_power)),main=paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

dev.off()