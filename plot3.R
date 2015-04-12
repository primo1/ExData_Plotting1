#
# plot3.R
#

library(data.table)
library(lubridate)

data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)        # Read data set
data <- data[complete.cases(data),]                                                                                 # Remove missing values
data$Date <- as.Date(data$Date, "%d/%m/%Y")                                                                         # Coerce Date column to as.Date
x <- data[which((data$Date >= "2007-02-01" & data$Date<= "2007-02-02")), ]                                          # Subset 2007-02-01 and 2007-02-02 dates 
x <- data.table(x)                                                                                                  # Coerce data set to data.table
x <- x[, DateTime:=paste(x$Date, x$Time)]  
x$DateTime <- ymd_hms(x$DateTime)                                                                                   # Coerce DateTime column to as.Date

png(width=480, height=480, file = "plot3.png")                                                                      # Open a PNG device
par(font.lab = 2, font.axis = 2)                                                                                    # Set font for plot x/y lable and axis anootation to bold 
with(x, plot(DateTime, Sub_metering_1, type="l", col = "black",xlab = "", ylab = "Energy sub metering"))            # Plot DateTime / Sub_metering_1, Sub_metering_2, Sub_metering_3
with(x, lines(DateTime, Sub_metering_2, type="l", col = "red"))
with(x, lines(DateTime, Sub_metering_3, type="l", col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"),                                                          # Set legend parameters
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex =  0.8, text.font = 2)                               

dev.off()                                                                                                           # Close PNG device