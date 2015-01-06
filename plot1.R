#
# This file is for plot 1 for Expolitory Data Analysis Project 1
#
###############################################################################

# Step 1 Set the file locations and read the file
# Note: This file assumes the data file exists in the "explore_p_1" subdirectory
#       under the working directory
###############################################################################

readfile <- paste(getwd(),"/explore_p_1", "/", "household_power_consumption.txt",
                 sep="")
writefile <- paste(getwd(),"/explore_p_1", "/", "plot1.png", sep="")

# Read the file
power.df <- as.data.frame(read.table(readfile, header=TRUE, sep=";",
                                     na.strings="?"))

# Step 2 Clean the data set
###############################################################################

# Change the class of the data and time columns
power.df$Time <- as.character(power.df$Time)
power.df$Time <- strptime(power.df$Time, format="%H:%M:%S")
power.df$Date <- as.character(power.df$Date)
power.df$Date <- as.Date(power.df$Date, format="%d/%m/%Y")

#subset the data frame to innclude only the dates of interest
power.df <- subset(power.df, Date == "2007-02-01" | Date == "2007-02-02")

# Step 3 Generate the histogram
###############################################################################

png(filename = writefile, width = 480, height = 480, units = "px", bg = "white")
par(mar = c(6, 6, 5, 4))
hist(power.df$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power(kilowatts)")
dev.off()