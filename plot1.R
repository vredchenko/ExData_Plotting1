# read in the dataset
cClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric");
readings = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses=cClasses);
readings$Date <- as.Date(readings$Date,format="%d/%m/%Y");
# subset date for the two days we need
readings <- readings[(readings$Date > as.Date("2007-01-31") & readings$Date < as.Date("2007-02-03")),];
# save to 480*480 plot1.png
png(file = "plot1.png", width = 480, height = 480, units = "px");
# draw the histogram
hist(readings$Global_active_power, 12, col="orange", main="Global Active Power", xlab="Global Active Power (kilowatts)");
# close graphics device
dev.off();