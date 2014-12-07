if(!exists("hpc")){
  source("getdataiffnotexist.R")
  hpc<-getdataiffnotexist()
}

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(hpc$DateTime, as.numeric(hpc$Sub_metering_1), 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(hpc$DateTime, as.numeric(hpc$Sub_metering_2), col = "red")
lines(hpc$DateTime, as.numeric(hpc$Sub_metering_3), col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()