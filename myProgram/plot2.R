# plot2.R 

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

# Construct plot 2
png(file = "plot2.png",width=480, height=480)

with(subhouse, plot(datetime, Global_active_power, type="l", 
                    ylab="Global Active Power (kilowatts)", xlab=""
                    )) 

## Don't forget to close the PNG device!
dev.off() 