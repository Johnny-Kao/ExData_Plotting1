## Set file dictory
setwd("/Users/Johnny/Downloads")

## Set file name
fn <- "household_power_consumption.txt"

## Read file 
df <- read.table(fn, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)),na.strings = "?")

## Change Date format ,Subset required file
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df_sub <- with(df, subset(df, Date == "2007-02-01" | Date == "2007-02-02"))

## Set png 
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## Draw hist
hist(df_sub$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequncy",main = "Global Active Power")

## Save file
dev.off()