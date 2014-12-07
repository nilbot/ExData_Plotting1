if(!exists("hpc")){
  source("getdataiffnotexist.R")
  hpc<-getdataiffnotexist()
}

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))

DateTime<-hpc$DateTime
Global_active_power <- as.numeric(hpc$Global_active_power)
Voltage <- as.numeric(hpc$Voltage)
Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
Sub_metering_3<- as.numeric(hpc$Sub_metering_3)
Global_reactive_power<- as.numeric(hpc$Global_reactive_power)
## Top-left
plot(DateTime, Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top-right
plot(DateTime, Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(DateTime, Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
## Bottom-right
plot(DateTime, Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = colnames(hpc)[2])
dev.off()