# source data: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:\\Users\\srobin\\Documents\\R\\data\\Exploritory")
# read the data
power <- read.csv("household_power_consumption.txt", sep=";", )

# changed the date from a factor to a date
# combine data and time
power$datetime <- paste(power$Date,power$Time)
power$datetime <- strptime(power$datetime, "%d/%m/%Y %H:%M:%OS")

power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(power$Time,format="%H:%M:%S")

# subset the data for 2/1/2007 and 2/2/2007 only
# could not figure out how to read only this data
power2 <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

# set directory for Github - save image there
setwd("C:\\Users\\srobin\\Documents\\GitHub\\ExData_Plotting1")

sub1 <- as.numeric(as.character(power2$Sub_metering_1))
sub2 <- as.numeric(as.character(power2$Sub_metering_2))
sub3 <- as.numeric(as.character(power2$Sub_metering_3))

y <- power2$datetime

png(filename = "plot3.png",
    width = 480, 
    height = 480)

plot(y,sub1,
     type="n",
     ylab="Energy sub metering", 
     xlab=""
     )

lines(y,sub1 ,type='S')
lines(y,sub2,type='s',col="red")
lines(y,sub3,type='S',col="blue")

legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       col=c(1,2,4), 
       lty=1,
       pt.cex=1,
       cex=0.8
              )



# copy graph as a png to current directory
#dev.copy(png,"plot3.png", width=480, height=480)

# turn off device
dev.off()


