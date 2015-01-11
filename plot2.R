# read in the dataset
cClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric");
readings = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses=cClasses);
# Convert to DateTime to use on the x-axis of the plot 
readings$DateTime <- as.POSIXct(paste(readings$Date, readings$Time), format="%d/%m/%Y %H:%M:%S");
readings$Date <- as.Date(readings$Date,format="%d/%m/%Y");
# subset date for the two days we need
readings <- readings[(readings$Date > as.Date("2007-01-31") & readings$Date < as.Date("2007-02-03")),];
# save to 480*480 plot2.png
png(file = "plot2.png", width = 480, height = 480, units = "px");
# draw the plot
plot(readings$DateTime, readings$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)");
# close graphics device
dev.off();