#
# This file is for plot 4 for Expolitory Data Analysis Project 1
#
###############################################################################

# Step 1 Set the file locations and read the file
# Note: This file assumes the data file exists in the "explore_p_1" subdirectory
#       under the working directory
###############################################################################

readfile <- paste(getwd(),"/explore_p_1", "/", "household_power_consumption.txt",
                 sep="")
writefile <- paste(getwd(),"/explore_p_1", "/", "plot4.png", sep="")

# Read the file
power.df <- as.data.frame(read.table(readfile, header=TRUE, sep=";",
                                     na.strings="?"))

# Step 2 Clean the data set
###############################################################################

#subset the data frame to innclude only the dates of interest
power.df <- subset(power.df, Date == "1/2/2007" | Date == "2/2/2007")

# Merge Date & Time into one filed and change the class 
power.df$DateTime <- paste(power.df$Date, power.df$Time, sep=" ")
power.df$DateTime <- strptime(power.df$DateTime, format="%d/%m/%Y %H:%M:%S")


# Step 3 Generate the line graph
###############################################################################

# open the file
png(filename = writefile, width = 480, height = 480, units = "px", bg = "white")

# Set for a 2 by 2 picture
par(mfrow=c(2, 2))

# Generate graph 1 (upper left)
plot(power.df$DateTime, power.df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")

# Generate graph 2 (upper right)
plot(power.df$DateTime, power.df$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")


# Generate graph 3 (lower left)
plot(power.df$DateTime, power.df$Sub_metering_1, type="n", 
     xlab="", ylab="Energy sub metering")
lines(power.df$DateTime, power.df$Sub_metering_1, col="black")
lines(power.df$DateTime, power.df$Sub_metering_2, col="red")
lines(power.df$DateTime, power.df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n", lty=1)

# Generate graph 4 (lower right)
plot(power.df$DateTime, power.df$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

# close the file
dev.off()