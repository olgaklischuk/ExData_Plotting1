png(file="plot2.png",width=480, height=480)

par(mfrow=c(1,1),mai=c(.5,.9,.1,.1),cex=.8)

plot2<-
  with(data = power.1, plot(as.numeric(Global_active_power), x=datetime, ylab="Global Active Power, kilowats",xlab="",main="",type="l"))
dev.off()