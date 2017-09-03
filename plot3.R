#readfile
rm(list = ls())
df = read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#-----Adjusting variables
df$Date=as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power=as.numeric(df$Global_active_power)
df$Global_reactive_power=as.numeric(df$Global_reactive_power)
df$Voltage=as.numeric(df$Voltage)
df$Global_intensity=as.numeric(df$Global_intensity)
df$Sub_metering_1=as.numeric(df$Sub_metering_1)
df$Sub_metering_2=as.numeric(df$Sub_metering_2)
df$Sub_metering_3=as.numeric(df$Sub_metering_3)

#-----Subseting data 
df = subset(df, df$Date == "2007-02-01" | df$Date == "2007-02-02")

#-----Adjusting Time Variable
df$Time = paste(df$Date, df$Time, sep=" ")
df$Time = strptime(df$Time, format = "%Y-%m-%d %H:%M:%S")

#-----Making Plot 3
png(filename="./plot3.png")
plot(df$Time,df$Sub_metering_1 ,type="n",xlab="",ylab="Energy sub metering")
lines(df$Time,df$Sub_metering_1,type="l")
lines(df$Time,df$Sub_metering_2,type="l", col="red")
lines(df$Time,df$Sub_metering_3,type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"),lty = 1)
dev.off()
