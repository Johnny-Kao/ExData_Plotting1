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
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## Set framework outline
par(mfrow = c(2, 2))

## Draw plot1
plot(df_sub$Date_Time, df_sub$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")

## Draw plot2
plot(df_sub$Date_Time, df_sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Draw plot3
plot(df_sub$Date_Time, df_sub$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
### Draw lines
points(df_sub$Date_Time, df_sub$Sub_metering_1, type = "l")
points(df_sub$Date_Time, df_sub$Sub_metering_2, type = "l", col = "red")
points(df_sub$Date_Time, df_sub$Sub_metering_3, type = "l", col = "blue")
### Draw legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Draw plot4
plot(df_sub$Date_Time, df_sub$Global_reactive_power, type = "l", xlab = "datetime")

## Save file
dev.off()