# For plot4.png of Course Project 1 of Exploratory Data Analysis.
# Creates a .png of a multiplot window containing four individual plots
# (2 x 2) for the electric power data over a two-day period from 
# 2007-02-01 to 2007-02-02.
# 1. plot2 from this project 
# 2. Voltage vs. time (in days)
# 3. plot3 from this project
# 4. Global Reactive Power vs. time (in days)


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

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(EPCData, {
     plot(EPCData$DateTime, as.numeric(as.character(EPCData$Global_active_power)), 
         type = "l",
         xlab = "",
         ylab = "Global Active Power")
     plot(EPCData$DateTime, as.numeric(as.character(EPCData$Voltage)), 
        type = "l",
        col = "black",
        xlab = "datetime",
        ylab = "Voltage")
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
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            bty = "n"
            )
     plot(EPCData$DateTime, as.numeric(as.character(EPCData$Global_reactive_power)), 
          type = "l",
          xlab = "datetime",
          ylab = "Global_reactive_power")
     }
    )
dev.off()