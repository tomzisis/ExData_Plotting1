download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="proj1.zip",mode="wb")
unzip("proj1.zip",exdir=".")
w2 <- read.table("./household_power_consumption.txt",sep=";",header=T,nrows=2075260,stringsAsFactors=F)
w21 <- filter(w2, Date == "1/2/2007" | Date == "2/2/2007" )
w21$Date <- as.Date(w21$Date,"%d/%m/%Y")
w21[,3:8] <- sapply(w21[,3:8],as.numeric)
w21 <- mutate( w21 , datetime = paste(w21$Date,w21$Time,sep=" ") )
w21$datetime <- strptime(w21$datetime,format="%Y-%m-%d %H:%M:%S")


png("plot4.png")

par(mfrow=c(2,2))

with(w21,{ 
  
plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power") 

plot(datetime,Voltage,type="l") 

plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering") 
lines(datetime,Sub_metering_2,col="red")  
lines(datetime,Sub_metering_3,col="blue")  
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

plot(datetime,Global_reactive_power,type="l")

})

dev.off()