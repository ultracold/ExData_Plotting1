# For plot1.png of Course Project 1 of Exploratory Data Analysis.
# Creates a .png of a histogram of Global Active Power usage over a 
# two-day period from 2007-02-01 to 2007-02-02.

electricPowerData <- read.csv("household_power_consumption.txt", sep = ";")
data <- electricPowerData

data$Date <- as.Date(as.character(data$Date), "%d/%m/%Y")

subSet <- subset(data,
                 Date <= as.Date("02/02/2007", "%d/%m/%Y") & Date >= as.Date("01/02/2007", "%d/%m/%Y")
                )

row.names(subSet) <- seq(nrow(subSet))

EPCData <- subSet

png("plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(EPCData$Global_active_power)),
                col = "red", 
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power",
                )
dev.off()




