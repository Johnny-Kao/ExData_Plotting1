## Set file dictory
setwd("/Users/Johnny/Downloads")

## Set file name
fn <- "household_power_consumption.txt"

## Read file 
df <- read.table(fn, header = TRUE, sep = ";", colClasses = c("character", "character", rep("numeric",7)),na.strings = "?")

## Change Date format ,Subset required file, add Date.Time column = Date + Time
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df_sub <- with(df, subset(df, Date == "2007-02-01" | Date == "2007-02-02"))
df_sub$Date_Time <- strptime(paste(df_sub$Date, df_sub$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

## Set png 
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## Draw hist
plot(df_sub$Date_Time, df_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Save file
dev.off()