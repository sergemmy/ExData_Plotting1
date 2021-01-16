library(dplyr)

filezip<-"exdata_data_household_power_consumption.zip"
filedat<-"household_power_consumption.txt"
#data<-scan(unz(filezip, filedat), what = list(Date="2007-02-01",Date="2007-02-02"))
data1 <- read.table(unz(filezip, filedat), sep=";", header = TRUE, na.strings = "?")
data1<-filter(data1, Date=="2/2/2007" | Date=="1/2/2007")
data1<-mutate(data1,DateTime=as.POSIXct(paste(data1$Date, data1$Time), format="%d/%m/%Y %H:%M:%S"))



#plot1
png("plot1.png",width=480, height=480)
hist(data1$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()