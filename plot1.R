download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="proj1.zip",mode="wb")
unzip("proj1.zip",exdir=".")
w2 <- read.table("./household_power_consumption.txt",sep=";",header=T,nrows=2075260,stringsAsFactors=F)
w21 <- filter(w2, Date == "1/2/2007" | Date == "2/2/2007" )
w21$Date <- as.Date(w21$Date,"%d/%m/%Y")
w21[,3:8] <- sapply(w21[,3:8],as.numeric)


png("plot1.png")


hist(w21$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")



dev.off()
