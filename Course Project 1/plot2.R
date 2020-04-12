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

#plot 2
par(mfrow=c(1,1))
plot(df2$DateTime,df2$Global_active_power,type="l",
     ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()
