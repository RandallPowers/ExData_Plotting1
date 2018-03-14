


#create plot2.png

dev.copy(png,"plot2.png", width=480, height=480)
         plot(data$Global_active_power~data$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
         dev.off()
         