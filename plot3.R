png(file="plot3.png",width=480, height=480)

par(mfrow=c(1,1),mai=c(.6,.9,.1,.1),cex=.8)

l1<-with(data=power.1,plot(y=as.numeric(Sub_metering_1),x=datetime,ylab="Energy sub metering",xlab="",col="grey8",type="l",lwd=1.5))

l2<-with(data=power.1,lines(y=as.numeric(Sub_metering_2),x=datetime,col="red",type="l",lwd=1.5))

l3<-with(data=power.1,lines(y=as.numeric(Sub_metering_3),x=datetime,col="blue",type="l",lwd=1.5))

  legend<-legend("topright",legend=paste("Sub_metering_",1:3,sep=""),col=c("grey8","red","blue"),lty=1, cex=.9)

dev.off()