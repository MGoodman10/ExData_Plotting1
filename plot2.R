#
# This file is for plot 2 for Expolitory Data Analysis Project 1
#
###############################################################################

# Step 1 Set the file locations and read the file
# Note: This file assumes the data file exists in the "explore_p_1" subdirectory
#       under the working directory
###############################################################################

readfile <- paste(getwd(),"/explore_p_1", "/", "household_power_consumption.txt",
                 sep="")
writefile <- paste(getwd(),"/explore_p_1", "/", "plot2.png", sep="")

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

png(filename = writefile, width = 480, height = 480, units = "px", bg = "white")
par(mar = c(6, 6, 5, 4))
plot(power.df$DateTime, power.df$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()