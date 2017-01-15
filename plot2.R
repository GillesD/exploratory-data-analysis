donnees <- read.table("household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
donnees <- subset(donnees, (donnees$Date == "1/2/2007" | donnees$Date== "2/2/2007")) 
# change the date format
donnees$Date <- as.Date(donnees$Date, format = "%d/%m/%Y")

donnees$DateTime <- as.POSIXct(paste(donnees$Date, donnees$Time))



# creating Plot2
png("plot2.png", width=480, height= 480)

plot(donnees$DateTime, donnees$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

dev.off()