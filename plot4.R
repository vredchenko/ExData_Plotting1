# read in the dataset
cClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric");
readings = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses=cClasses);
# Convert to DateTime to use on the x-axis of the plot 
readings$DateTime <- as.POSIXct(paste(readings$Date, readings$Time), format="%d/%m/%Y %H:%M:%S");
readings$Date <- as.Date(readings$Date,format="%d/%m/%Y");
# subset date for the two days we need
readings <- readings[(readings$Date > as.Date("2007-01-31") & readings$Date < as.Date("2007-02-03")),];
# save to 480*480 plot4.png
png(file = "plot4.png", width = 480, height = 480, units = "px");
# set up layout
par(mfrow = c(2,2));
# first plot
plot(readings$DateTime, readings$Global_active_power, type="l", xlab="", ylab="Global Active Power");
# second plot
plot(readings$DateTime, readings$Voltage, type="l", xlab="DateTime", ylab="Voltage");
#third plot
with(readings, plot(readings$DateTime, readings$Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"));
with(readings, lines(readings$DateTime, readings$Sub_metering_1, type="l", col="black" ));
with(readings, lines(readings$DateTime, readings$Sub_metering_2, type="l", col="red" ));
with(readings, lines(readings$DateTime, readings$Sub_metering_3, type="l", col="blue"));
legend("topright", pch="-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"));
#fourth plot
plot(readings$DateTime, readings$Global_reactive_power, type="l", xlab="DateTime", ylab="Global Reactive Power");
# close graphics device
dev.off();