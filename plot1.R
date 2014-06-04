# source data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:\\Users\\srobin\\Documents\\R\\data\\Exploritory")
# read the data
power <- read.csv("household_power_consumption.txt", sep=";", )

# changed the date from a factor to a date 
power$Date <- as.Date(power$Date,"%d/%m/%Y")

# subset the data for 2/1/2007 and 2/2/2007 only
# could not figure out how to read only this data
power2 <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# set directory for Github - save image there
setwd("C:\\Users\\srobin\\Documents\\GitHub\\ExData_Plotting1")

# create a histogram  divided Global_active_power by 500 
hist(as.numeric(power2$Global_active_power)/500, 
     xlab="Global Active Power (Kilowatts)", 
     ylab="Frequency",
     main="Global Active Power", 
     col="red" )

# copy graph as a png to current directory
dev.copy(png,"plot1.png", width=480, height=480)

# turn off device
dev.off()



