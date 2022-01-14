#PLOT 1

setwd("C:/Users/customer/2ndminiproject/household_power_consumption_data")      #set the working directory to the local file
                                                                                #where the Household power consumption data exist.

stat <-read.table("household_power_consumption.txt",sep=";",header=TRUE)        #Access the txt file of the data using the 
                                                                                #read.table function and store to the variable stat.

dates<-as.Date(stat$Date, format="%d/%m/%Y")                                    #In the stat data, access the Date info in the 
                                                                                #format of day/month/year and store to dates. 

stat<-stat[dates=="2007-02-02"|dates=="2007-02-01",]                            #Set the dates from 2007/2/2 to 2007/2/1 
                                                                                #and store to the updated stat variable. 

time<-paste(dates,stat$Time,sep=" ")                                            #Using the paste function, concatenate the vectors 
                                                                                #from dates and stat$Time and store in the time variable.

time<-strptime(time, format="%Y-%m-%d %H:%M:%S")                                #Update the time variable by setting the format of time using the strptime function.
                                                                                #The format is Year/month/day for dates and hour-minutes-seconds for time.

GAP<-as.numeric(stat$Global_active_power)                                       #GAP stands for global active power. Using the as.numeric function, 
                                                                                #access the Global active power data in the stat variable in numeric values.
                                                                                #Store the data in GAP.

png("plot1.png", width = 480, height = 480)                                     #Convert the plot to png and set the height and width to 480.
                                                                                #Name the plot- plot1.png.

hist(GAP,xlab="Global Active Power (kilowatts)",ylab="Frequency", 
     main= "Global Active Power",col="red", bg = "white")                       #Create a histogram using the hist function for the GAP data. 
                                                                                #Label the x-axis "Global Active Power (kilowatts)" and the y-axis "Frequency".
                                                                                #Set the title to "Global Active Power"; and the color of the columns red. 

dev.off()                                                                       #Shut down the png function and the png will be saved to the working directory.


#PLOT 2

png("plot2.png", width = 480, height = 480)                                     #Convert the plot to png and set the height and width to 480.
                                                                                #Name the plot- plot2.png.

plot(GAP, type="l", ylab="Global Active Power (kilowatts)", xlab="")            #plot GAP, Set the graph to type 1 (results in lines),
                                                                                #and label the y-axis "Global Active Power (kilowatts)".

dev.off()                                                                       #Shut down the png function and the png will be saved to the working directory.


#PLOT 3

SUB1<- as.numeric(stat$Sub_metering_1)                                          #Store to SUB1 the numerical values of Sub_metering_1 from the stat dataset.
SUB2<- as.numeric(stat$Sub_metering_2)                                          #Store to SUB2 the numerical values of Sub_metering_2 from the stat dataset.
SUB3<- as.numeric(stat$Sub_metering_3)                                          #Store to SUB3 the numerical values of Sub_metering_3 from the stat dataset.

par(mfrow=c(2,2), mar=c(1,1,1,1), oma=c(0,0,2,0))                               #The par function is used to set parameters for the plot.
                                                                                #mfrow represents a 2-by-2 array.
                                                                                #mar represents the 1 line margin on all sides.
                                                                                #oma represents the 2 top outer margin for the plot.


png("plot3.png", width = 480, height = 480)                                     #Convert the plot to png nd set the height and width to 480.
                                                                                #Name the plot plot3.png

plot(SUB1, type="l", 
    ylab="Energy sub metering", xlab="")                                        #plot SUB1 and label the y-axis "Energy sub metering".

    lines(SUB2,col='Red')                                                       #Using the lines function, add the line segments for SUB2 (in red color)
    lines(SUB3,col='Blue')                                                      #and another line segment for SUB3 (in blue color)
    
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))      # #the legend function serves as the guide for the plot. 
                                                                                #The legend states the variable and their assigned color. 
                                                                                #It is located in the top right portion of the visual.
    
dev.off()                                                                       #Shut down the png function and the png will be saved to the working directory.


#PLOT 4 

VOLT<-as.numeric(stat$Voltage)                                                  #Store to VOLT the numerical values of Voltage from the stat dataset.
GRP<-as.numeric(stat$Global_reactive_power)                                     #Store to GRP the numerical values of Global_reactive_power from the stat dataset.

par(mfrow=c(2,2))                                                               #set the parameter to a 2x2 array.

plot(GAP, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")                           #The plot represents plot2 from the previous item. 

plot(VOLT, type="l", 
     ylab="Voltage (volt)", xlab="datetime")                                    #plot VOLT and label the y-axis "Voltage (volt)".                      

plot(SUB1, type="l", 
     ylab="Energy sub metering", xlab="")                                       #The plot represents plot3 from the previous item.
lines(SUB2,col='Red')
lines(SUB3,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

plot(GRP, type="l", 
     ylab="Global Reactive Power (kilowatts)",xlab="datetime")                   #plot GRP and label the y-axis "Global Reactive Power (kilowatts)".      

dev.copy(png, file="plot4.png", height=480, width=480)                          #use the dev.copy function to compile all plots and save as plot4.png 

dev.off()                                                                       #Shut down the png function and the png will be saved to the working directory.
