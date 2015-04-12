#
# plot2.R
#

library(data.table)
library(lubridate)

data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE)        # Read data set
data <- data[complete.cases(data),]                                                                                 # Remove missing values
data$Date <- as.Date(data$Date, "%d/%m/%Y")                                                                         # Coerce Date column to as.Date
data$Global_active_power <- as.numeric(data$Global_active_power)                                                    # Coerce  to Global_active_power column to numeric
x <- data[which((data$Date >= "2007-02-01" & data$Date<= "2007-02-02")), ]                                          # Subset 2007-02-01 and 2007-02-02 dates 
x <- data.table(x)                                                                                                  # Coerce data set to data.table
x <- x[, DateTime:=paste(x$Date, x$Time)]                                                                           # Add a new conlumn "DayeTime", which consits of date and time
x$DateTime <- ymd_hms(x$DateTime)                                                                                   # Coerce DateTime column to as.Date

png(width=480, height=480, file = "plot2.png")                                                                      # Open a PNG device
par(font.lab = 2, font.axis = 2)                                                                                    # Set font for plot x/y lable and axis anootation to bold                               
with(x, plot(DateTime, Global_active_power, type="l",  xlab = "", ylab = "Global Active Power (kilowatts)"))        # Plot DateTime / Global_active_power

dev.off()                                                                                                           # Close PNG device