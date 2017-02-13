householdPWR <- read.delim("../household_power_consumption.txt",sep = ";")
householdPWR[,1] <- as.Date(householdPWR[,1], format = "%d/%m/%Y")

startDate <- as.Date("2007/02/01")
endDate <- as.Date("2007/02/02")

rangehouseholdPWR <- householdPWR[householdPWR[,1] == startDate | householdPWR[,1] == endDate,]

rangehouseholdPWR[,3] <- as.numeric(as.character(rangehouseholdPWR[,3]))


rangehouseholdPWR$dateTime <- paste(rangehouseholdPWR$Date, rangehouseholdPWR$Time)

rangehouseholdPWR$dateTime <- as.POSIXct(rangehouseholdPWR$dateTime)

plot(y = rangehouseholdPWR[,3], x = rangehouseholdPWR$dateTime ,ylab = "Global Active Power (kilowatts)", xlab="", type="o", pch ='.')

dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()
