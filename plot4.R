#Loads data
householdPWR <- read.delim("../household_power_consumption.txt",sep = ";")

#Reformats Data col into Data class
householdPWR[,1] <- as.Date(householdPWR[,1], format = "%d/%m/%Y")


#2x2 subplots, fill by row
par(mfrow=c(2,2))

#Start and end date
startDate <- as.Date("2007/02/01")
endDate <- as.Date("2007/02/02")

#Takes subset with start and end date
rangehouseholdPWR <- householdPWR[householdPWR[,1] == startDate | householdPWR[,1] == endDate,]

#Prepares date and time for data points
rangehouseholdPWR$dateTime <- paste(rangehouseholdPWR$Date, rangehouseholdPWR$Time)
rangehouseholdPWR$dateTime <- as.POSIXct(rangehouseholdPWR$dateTime)

#Plot 1
rangehouseholdPWR[,3] <- as.numeric(as.character(rangehouseholdPWR[,3]))

hist(as.numeric(rangehouseholdPWR[,3]), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Plot 2
rangehouseholdPWR$Voltage <- as.numeric(as.character(rangehouseholdPWR$Voltage))

plot(y = rangehouseholdPWR$Voltage, x = rangehouseholdPWR$dateTime ,ylab = "Voltage", xlab="datetime", type="o", pch = '.' )


#Plot 3
rangehouseholdPWR[,7] <- as.numeric(as.character(rangehouseholdPWR[,7]))
rangehouseholdPWR[,8] <- as.numeric(as.character(rangehouseholdPWR[,8]))
rangehouseholdPWR[,9] <- as.numeric(as.character(rangehouseholdPWR[,9]))

plot(y = rangehouseholdPWR[,7], x = rangehouseholdPWR$dateTime ,ylab = "Global Active Power (kilowatts)", xlab="", type="o", pch = '.' )
lines(y = rangehouseholdPWR[,8], x = rangehouseholdPWR$dateTime, col="red")
lines(y = rangehouseholdPWR[,9], x = rangehouseholdPWR$dateTime, col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)


#Plot 4
rangehouseholdPWR$Global_reactive_power <- as.numeric(as.character(rangehouseholdPWR$Global_reactive_power))

plot(y = rangehouseholdPWR$Global_reactive_power, x = rangehouseholdPWR$dateTime ,ylab = "Global_reactive_power", xlab="datetime", type="o", pch = '.' )

#saves and closes.
dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()



