#plot3.R

# Set up working directory
setwd("F:/class/4.Exploratory/")
getwd()

library(sqldf)

# Read in input file

house <- read.table("household_power_consumption.txt", sep=";", 
                 colClasses=c("character","character","numeric","numeric",
                              "numeric","numeric","numeric","numeric","numeric"), 
                 header=T, comment.char=" ", na.strings='?')

# Only keep the relavent data points
subhouse <- subset(house, Date =='1/2/2007' | Date=='2/2/2007')

#Create new variable datetime
x <- paste(subhouse$Date, subhouse$Time)
subhouse$datetime <- strptime(x, "%d/%m/%Y %H:%M:%OS")

summary(subhouse)

# Construct plot 3
png(file = "plot3.png",width=480, height=480)

with(subhouse, plot(datetime,Sub_metering_1,type = "n",
      xlab = "", ylab = "Energy sub metering"),ylim(0,30))

with(subhouse, points(datetime,Sub_metering_1,type = "l", col = "black"))
with(subhouse, points(datetime,Sub_metering_2,type = "l", col = "red"))
with(subhouse, points(datetime,Sub_metering_3,type = "l", col = "blue"))

legend("topright", col = c("black", "red", "blue"), lty= "solid", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

## Don't forget to close the PNG device!
dev.off() 


