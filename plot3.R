donnees <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
donnees<- subset(donnees, (donnees$Date == "1/2/2007" | donnees$Date== "2/2/2007")) 
# change the date format
donnees$Date <- as.Date(donnees$Date, format = "%d/%m/%Y")

donnees$DateTime <- as.POSIXct(paste(donnees$Date, donnees$Time))



# creating Plot3

png("plot3.png", width = 480, height = 480)

plot(donnees$DateTime, donnees$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(donnees$DateTime, donnees$Sub_metering_2, type="l", col="red")

lines(donnees$DateTime, donnees$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()