## Read full dataset 
data_epc <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data_epc$Date <- as.Date(data_epc$Date, format="%d/%m/%Y") 
 
## Subset data from  "2007-02-01" to "2007-02-02"
data <- subset(data_epc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data_epc) 
 
## Convert dates
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 
 
## Plot 1 
hist(data$Global_active_power, main="Global Active Power",  
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 
 
## Saving to file 
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 

