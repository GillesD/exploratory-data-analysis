donnees <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
donnees <- subset(donnees, (donnees$Date == "1/2/2007" | donnees$Date== "2/2/2007")) 
# change the date format
donnees$Date <- as.Date(donnees$Date, format = "%d/%m/%Y")

donnees$DateTime <- as.POSIXct(paste(donnees$Date, donnees$Time))



# creating Plot4
png("plot4.png", width = 480, height = 480)

# divide the plot device into four subplots
par(mfrow=c(2,2)) 
# top left
plot(donnees$DateTime, donnees$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
# top right
plot(donnees$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   
# bottom left
plot(donnees$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(donnees$DateTime, donnees$Sub_metering_2, type="l", col="red")
lines(donnees$DateTime, donnees$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 
# bottom right
plot(donnees$DateTime, donnees$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  

dev.off()