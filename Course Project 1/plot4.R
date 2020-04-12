
#load txt file
df<- read.table("household_power_consumption.txt",sep=";",header=T)

#merge columns Date and Time
df$DateTime<-paste(df$Date,df$Time)

#transform column DateTime 
df$DateTime<- strptime(df$DateTime, format="%d/%m/%Y %H:%M:%S")

#transform column Date  
df$Date<- as.Date(df$DateTime)

#filter rows for dates 2007/02/01 and 2007/02/02
df2<-subset(df,Date>="2007-02-01" & Date <= "2007-02-02")

#transform numeric variables to numeric format
df2$Global_active_power<-as.numeric(gsub(",",".",df2$Global_active_power))
df2$Sub_metering_1<-as.numeric(gsub(",",".",df2$Sub_metering_1))
df2$Sub_metering_2<-as.numeric(gsub(",",".",df2$Sub_metering_2))
df2$Sub_metering_3<-as.numeric(gsub(",",".",df2$Sub_metering_3))
df2$Global_reactive_power<-as.numeric(gsub(",",".",df2$Global_reactive_power))
df2$Voltage<-as.numeric(gsub(",",".",df2$Voltage))

#plot 4
par(mfrow=c(2,2),mar=c(4,4,2,1))
plot(df2$DateTime,df2$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",xlab = "")
plot(df2$DateTime,df2$Voltage,type="l",
     ylab = "Global Active Power (kilowatts)",xlab = "datetime")
plot(df2$DateTime,df2$Sub_metering_1,type="l",ylab ="Energy sub metering",xlab="")
lines(df2$DateTime,df2$Sub_metering_2,col="red")
lines(df2$DateTime,df2$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lty=1, lwd=2,cex = 0.2,y.intersp = 0.1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(df2$DateTime,df2$Global_reactive_power,type="l",
     ylab = "Global Reactive Power ",xlab = "datetime")
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()