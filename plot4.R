# source data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:\\Users\\srobin\\Documents\\R\\data\\Exploritory")
# read the data
power <- read.csv("household_power_consumption.txt", sep=";", )


# changed the date from a factor to a date 
power$datetime <- paste(power$Date,power$Time)
power$datetime <- strptime(power$datetime, "%d/%m/%Y %H:%M:%OS")
power$Date <- as.Date(power$Date,"%d/%m/%Y")

power$Time <- strptime(power$Time,format="%H:%M:%S")
# subset the data for 2/1/2007 and 2/2/2007 only
# could not figure out how to read only this data
power2 <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# set directory for Github - save image there
setwd("C:\\Users\\srobin\\Documents\\GitHub\\ExData_Plotting1")

par(mfrow=c(2,2))

# plot 1

x <- as.numeric(as.character(power2$Global_active_power))
y <- power2$datetime
 
plot(y,x, 
     ylab="Global Active Power (Kilowatts)", 
     xlab="",
     main="Global Active Power", 
     col="black",
     type="n")

lines(y,x,type='S')


# Plot 2
y <- power2$datetime
volt <- as.numeric(as.character(power2$Voltage))


plot(y,volt,
     type='s', 
     xlab="datetime", 
     ylab="Voltage",
     ylim= c(234,246))


#  Plot 3
sub1 <- as.numeric(as.character(power2$Sub_metering_1))
sub2 <- as.numeric(as.character(power2$Sub_metering_2))
sub3 <- as.numeric(as.character(power2$Sub_metering_3))

y <- power2$datetime
 
plot(y,sub1,
     type="n",
     ylab="Energy sub metering", 
     xlab="")

lines(y,sub1,type='S')
lines(y,sub2,type='S',col="red")
lines(y,sub3,type='S',col="blue")


# Plot 4
y <- power2$datetime
x <- as.numeric(as.character(power2$Global_reactive_power))

plot(y, x,
     type="s",
     ylab="Global_reactive_power", 
     xlab="datetime"
     )

# copy graph as a png to current directory
dev.copy(png,"plot4.png", width=480, height=480)

# turn off device
dev.off()

