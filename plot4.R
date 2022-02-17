png(file="plot4.png",width=480, height=480)

par(mfrow=c(2,2), oma=c(.1,.1,.,.1)*5, mar=c(.1,.1,.,.1)*5, mai=c(.3,.7,.4,.1),cex=.7)

p1<- with(data = power.1, plot(as.numeric(Global_active_power), x=datetime, ylab="Global Active Power",xlab="",main="",type="l",cex=.5))
p2<- with(data=power.1,plot(y=as.numeric(Voltage),x=datetime,xlab="datetime",ylab="Voltage",type="l",cex=.5))
p3<-
  with(data=power.1,plot(y=as.numeric(Sub_metering_1),x=datetime,ylab="Energy sub metering",xlab="",col="grey9",type="l",cex=.7))+
  with(data=power.1,lines(y=as.numeric(Sub_metering_2),x=datetime,col="red",type="l",cex=.7))+
  with(data=power.1,lines(y=as.numeric(Sub_metering_3),x=datetime,col="blue",type="l",cex=.7))+
  legend("topright",legend=paste("Sub_metering_",1:3,sep=""),col=c("grey9","red","blue"),lty=1,bty="n",cex=.7)
p4<- with(data=power.1,plot(y=as.numeric(Global_reactive_power),x=datetime,xlab="datetime",ylab="Global_reactive_power",type="l",cex=.5))

dev.off()
