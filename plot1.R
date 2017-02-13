householdPWR <- read.table("../household_power_consumption.txt",sep = ";", header = TRUE)
householdPWR[,1] <- as.Date(householdPWR[,1], format = "%d/%m/%Y") 

startDate <- as.Date("2007/02/01")
endDate <- as.Date("2007/02/02")

rangehouseholdPWR <- householdPWR[householdPWR[,1] == startDate | householdPWR[,1] == endDate,]

globlActivePower <- as.numeric(as.character(rangehouseholdPWR[,3]))

hist(as.numeric(globlActivePower), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
