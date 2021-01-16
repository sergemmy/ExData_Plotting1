library(dplyr)

filezip<-"exdata_data_household_power_consumption.zip"
filedat<-"household_power_consumption.txt"
#data<-scan(unz(filezip, filedat), what = list(Date="2007-02-01",Date="2007-02-02"))
data1 <- read.table(unz(filezip, filedat), sep=";", header = TRUE, na.strings = "?")
data1<-filter(data1, Date=="2/2/2007" | Date=="1/2/2007")
data1<-mutate(data1,DateTime=as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S"))

#plot3
png("plot3.png",width=480, height=480)
plot(data1$DateTime,data1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data1$DateTime,data1$Sub_metering_2, type="l", col="red")
lines(data1$DateTime,data1$Sub_metering_3, type="l", col="blue")
legend ("topright", cex=0.85,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1,1))
dev.off()