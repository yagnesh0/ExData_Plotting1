householdPWR <- read.delim("../household_power_consumption.txt",sep = ";")
householdPWR[,1] <- as.Date(householdPWR[,1], format = "%d/%m/%Y")

startDate <- as.Date("2007/02/01")
endDate <- as.Date("2007/02/02")

rangehouseholdPWR <- householdPWR[householdPWR[,1] == startDate | householdPWR[,1] == endDate,]

rangehouseholdPWR[,7] <- as.numeric(as.character(rangehouseholdPWR[,7]))
rangehouseholdPWR[,8] <- as.numeric(as.character(rangehouseholdPWR[,8]))
rangehouseholdPWR[,9] <- as.numeric(as.character(rangehouseholdPWR[,9]))

rangehouseholdPWR$dateTime <- paste(rangehouseholdPWR$Date, rangehouseholdPWR$Time)
rangehouseholdPWR$dateTime <- as.POSIXct(rangehouseholdPWR$dateTime)

plot(y = rangehouseholdPWR[,7], x = rangehouseholdPWR$dateTime ,ylab = "Global Active Power (kilowatts)", xlab="", type="o", pch = '.' )
lines(y = rangehouseholdPWR[,8], x = rangehouseholdPWR$dateTime, col="red")
lines(y = rangehouseholdPWR[,9], x = rangehouseholdPWR$dateTime, col="blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)


dev.copy(png,"plot3.png", width = 480, height = 480)
dev.off()



