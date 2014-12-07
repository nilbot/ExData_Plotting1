if(!exists("hpc")){
  source("getdataiffnotexist.R")
  hpc<-getdataiffnotexist()
}
png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
plot(hpc$DateTime, as.numeric(hpc$Global_active_power), 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
