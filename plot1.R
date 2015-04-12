#
# plot1.R
#

library(lubridate)

data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)        # Read data set
data <- data[complete.cases(data),]                                                                                 # Remove missing values
data$Date <- as.Date(data$Date, "%d/%m/%Y")                                                                         # Coerce Date column to as.Date
data$Global_active_power <- as.numeric(data$Global_active_power)                                                    # Coerce  to Global_active_power column to numeric
x <- data[which((data$Date >= "2007-02-01" & data$Date<= "2007-02-02")), ]                                          # Subset 2007-02-01 and 2007-02-02 dates 

png(width=480, height=480, file = "plot1.png")                                                                      # Open a PNG device
par(lwd =2, font.main = 2, font.lab = 2, font.axis = 2)                                                             # Set histogram border line width to 2, font for plot title and axis anootation to bold                               
hist(x$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")    # Plot histogram for Global Active Power 

dev.off()                                                                                                           # Close PNG device