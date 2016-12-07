#### Use for downloading, unzipping and making Plots for Assignment One and Exploratory Data Analysis
#
# Step 1: Download the file (copy from dowload directory to Coursera), Set directory.
setwd("C:/Users/default.TOSHIBA/Desktop/Coursera")

# Step 2: Unzip the File and make new folder called Power
unzip(zipfile="C:/Users/default.TOSHIBA/Desktop/Coursera/exdata_data_household_power_consumption.zip",exdir="C:/Users/default.TOSHIBA/Desktop/Coursera/Power")

# Step 3: Read the data 
data <- read.table("C:/Users/default.TOSHIBA/Desktop/Coursera/Power/household_power_consumption.txt",header=T,sep=";", na.strings ="?")  ## 
head(data)
names(data)
dim(data) #Looks good

# Step 4:  Subset dates to 2007-02-01 and 2007-02-02.
data1 <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ] # select 2 days for plotting                               ]
head(data1,n=1)
names(data1)
dim(data1) ## 2880 observations  9 variables 

## Step 5: Merge the Date and Time columns to a new column using strptime() or and as.Date() funstions
data1$Date_Time <- paste(data1$Date,data1$Time)   # Make a new column
names(data1)                                      # Check names in file 10 variables

data1$Date_Time <- strptime(data1$Date_Time,"%d/%m/%Y %H:%M:%S")# working
head(data1)
tail(data1)
summary(data1$Date_Time)  # Date_time writing

## Step 9 Last graph four panel plots
par(mfcol = c(2,2))
plot(x=data1$Date_Time, y=data1$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(x=data1$Date_Time, y=data1$Sub_metering_1, type="l", xlab="", ylab="Energy Sub Metering")
lines(x=data1$Date_Time, y=data1$Sub_metering_2, col="red")
lines(x=data1$Date_Time, y=data1$Sub_metering_3, col="blue")
legend("topright", lty=1,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))
plot(x=data1$Date_Time, y=data1$Voltage, type="l", xlab="", ylab="Voltage")
plot(x=data1$Date_Time, y=data1$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.copy(png, file="plot4.png")
dev.off()









