#Loads data
householdPWR <- read.delim("../household_power_consumption.txt",sep = ";")

#Reformats Data col into Data class
householdPWR[,1] <- as.Date(householdPWR[,1], format = "%d/%m/%Y")

#Start and end date
startDate <- as.Date("2007/02/01")
endDate <- as.Date("2007/02/02")

#Takes subset with start and end date
rangehouseholdPWR <- householdPWR[householdPWR[,1] == startDate | householdPWR[,1] == endDate,]

#Converts into numeric
rangehouseholdPWR[,3] <- as.numeric(as.character(rangehouseholdPWR[,3]))

#Prepares date and time for data points
rangehouseholdPWR$dateTime <- paste(rangehouseholdPWR$Date, rangehouseholdPWR$Time)
rangehouseholdPWR$dateTime <- as.POSIXct(rangehouseholdPWR$dateTime)

#Plots
plot(y = rangehouseholdPWR[,3], x = rangehouseholdPWR$dateTime ,ylab = "Global Active Power (kilowatts)", xlab="", type="o", pch ='.')

#Saves and turns off plot.
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()
