## Set working directory
setwd("C:/Users/xzhan86/Desktop/Coursera/Data science/Course 4 - Exploratory data analysis")

## Download data
filename <- "course_project1_data.zip"

## Download and unzip the dataset:
if (!file.exists(filename)){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, filename, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}

## Read data and extract data
data <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data.sub <- subset(data, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:00")

## Create histogram and save the png file
png("./course project 1 code_plot/plot1.png", width = 480, height = 480, units = "px")
with(data.sub, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()