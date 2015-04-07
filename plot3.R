# For plot3.png of Course Project 1 of Exploratory Data Analysis.
# Creates a .png of a line plot showing three different traces of
# energy sub-metering over a two-day period from 2007-02-01 to 2007-02-02.

electricPowerData <- read.csv("household_power_consumption.txt", sep = ";")
data <- electricPowerData

data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")

subSet <- subset(data,
                 Date <= as.Date("02/02/2007", "%d/%m/%Y") & Date >= as.Date("01/02/2007", "%d/%m/%Y")
)

row.names(subSet) <- seq(nrow(subSet))

EPCData <- subSet

EPCData$DateTime <- paste(EPCData$Date, EPCData$Time)

EPCData$DateTime <- strptime(EPCData$DateTime, format = "%Y-%m-%d %H:%M:%S") 

png("plot3.png", width = 480, height = 480)
plot(EPCData$DateTime, as.numeric(as.character(EPCData$Sub_metering_1)), 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(EPCData$DateTime, as.numeric(as.character(EPCData$Sub_metering_2)), 
     type = "l",
     col = "red")
lines(EPCData$DateTime, as.numeric(as.character(EPCData$Sub_metering_3)), 
     type = "l",
     col = "blue")
legend("topright", lwd = 1,
       col = c("black","red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )
dev.off()