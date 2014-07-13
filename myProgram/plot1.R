# plot1.R

# Set up working directory
setwd("F:/class/4.Exploratory/")

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

# Create plot 1  PNG file

png(file = "plot1.png",width=480, height=480)
par(bg="white")
hist(subhouse$Global_active_power, freq=TRUE, col="red",lty = 1, lwd = 1,
     xlab="Global active power (kilowatts)",
     main = "Global active power", ylim=c(0, 1200))

## Don't forget to close the PNG device!
dev.off() 

