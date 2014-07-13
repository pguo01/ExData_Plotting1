#plot4.R

# Set up working directory

setwd("F:/class/4.Exploratory/")
getwd()

# Read in input file
house <- read.table("household_power_consumption.txt", sep=";", 
                 colClasses=c("character","character","numeric","numeric",
                              "numeric","numeric","numeric","numeric","numeric"), 
                 header=T, comment.char=" ", na.strings='?')
summary(house)

# Only keep the relavent data points
subhouse <- subset(house, Date =='1/2/2007' | Date=='2/2/2007')

summary(subhouse)

#Create new variable datetime

x <- paste(subhouse$Date, subhouse$Time)
subhouse$datetime <- strptime(x, "%d/%m/%Y %H:%M:%OS")

summary(subhouse)

# Create a 2x2 panel PNG file
png(file = "plot4.png",width=480, height=480)

par(mfrow=c(2,2),mar=c(4,4,2,1))

# Plot 4.1
with(subhouse, plot(datetime, Global_active_power, type="l", 
                    ylab="Global Active Power", xlab=""
                    )) 
# Plot 4.2

with(subhouse, plot(datetime, Voltage, type="l", 
                    ylab="Voltage")) 

# Plot 4.3

with(subhouse, plot(datetime,Sub_metering_1,type = "n",
      xlab = "", ylab = "Energy sub metering"),ylim(0,30))

with(subhouse, points(datetime,Sub_metering_1,type = "l", col = "black"))
with(subhouse, points(datetime,Sub_metering_2,type = "l", col = "red"))
with(subhouse, points(datetime,Sub_metering_3,type = "l", col = "blue"))

legend("topright", col = c("black", "red", "blue"), lty= "solid",bty='n',
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# Plot 4.4
with(subhouse, plot(datetime, Global_reactive_power, type="l")) 

## Don't forget to close the PNG device!
dev.off() 
