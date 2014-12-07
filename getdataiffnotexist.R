getdataiffnotexist<-function(){
  dirname<-"data"
  zipname<-"data/hpc.zip"
  filename<-"data/household_power_consumption.txt"
  if(!file.exists(dirname)){
    dir.create(dirname)
  }
  if(!file.exists(zipname)){
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    
    if(.Platform$OS.type!="windows")download.file(url, destfile = zipname, method="curl")
    else download.file(url,destfile = zipname)
  }
  
  if(!file.exists(filename)) {
    unzip(zipname, exdir = dirname)
  }
  
  if(!require("data.table")){
    install.packages("data.table")
    library(data.table)
  }
  if(!require("dplyr")){
    install.packages("dplyr")
    library(dplyr)
  }
  
  
  suppressWarnings(hpc <- fread(filename, na.strings = c("?","")))
#   x<-paste(hpc$Date, hpc$Time)
#   hpc$DateTime<-strptime(x, "%d/%m/%Y %H:%M:%S")
  hpc[,DateTime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]
  hpc[,Date:=NULL]
  hpc[,Time:=NULL]
  projectRelevant <- filter(hpc, DateTime>=as.POSIXct("2007-02-01 00:00:00") & DateTime<as.POSIXct("2007-02-03 00:00:00"))
# projectRelevant <- filter(hpc, Date=="01/02/2007" | Date=="02/02/2007")
#   columns<-c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#   for (i in columns) {
#     projectRelevant[, i] <- as.numeric(projectRelevant[, i])
#   }
  
  projectRelevant
}