#Loads data
householdPWR <- read.table("../household_power_consumption.txt",sep = ";", header = TRUE)

#Reformats Data col into Data class
householdPWR[,1] <- as.Date(householdPWR[,1], format = "%d/%m/%Y") 

#Start and end date
startDate <- as.Date("2007/02/01")
endDate <- as.Date("2007/02/02")

#Takes subset with start and end date
rangehouseholdPWR <- householdPWR[householdPWR[,1] == startDate | householdPWR[,1] == endDate,]

#Converts into numeric
globlActivePower <- as.numeric(as.character(rangehouseholdPWR[,3]))

#Creates histogram
hist(as.numeric(globlActivePower), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Saves and turns off plot.
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
