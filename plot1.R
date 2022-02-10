Sys.setlocale("LC_ALL",locale="English")

if(!require("dplyr")){library("dplyr")}
library("lubridate")

#wd####
setwd("~/OneDrive/Jupyter notebook/Exploratory Data analysis")

#loading data sample####

directory<-"~/OneDrive/Jupyter notebook/Exploratory Data analysis/household_power_consumption.txt"#directory, where household power consumption is placed
household_power_consumption<- read.csv(directory, sep=";")
# load(paste(getwd(),"/working.environment/working.environment.RData",sep=""))
View(household_power_consumption)

#transforming####
power<-
household_power_consumption %>%
  mutate(Date=strptime(Date,format="%d/%m/%Y"), Time=strptime(Time,format="%T"))
power<-
  power%>%
  mutate(datetime=with(household_power_consumption, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")))

View(power)

var<-colnames(household_power_consumption)#names of variables

#numeric formatting data####
for(i in 4:length(var)-1){power[,i]<-as.numeric(power[,i])}

  power.1<-
  power %>%
  filter(Date>=as.Date("2007/02/01")&Date<=as.Date("2007/02/02"))

for(i in 4:length(var)-1){power.1[,i]<-as.numeric(power.1[,i])}

  power.1<-as.data.frame(power.1)
  
  View(power.1)

dir.create(paste(strsplit(getwd(),split = "/OneDrive")[[1]][1],"/OneDrive/Jupyter notebook/Exploratory Data analysis/Peer-assignment-review-1",sep=""))
setwd(paste(strsplit(getwd(),split = "/OneDrive")[[1]][1],"/OneDrive/Jupyter notebook/Exploratory Data analysis/Peer-assignment-review-1",sep=""))

#plotting####
# dev.cur()
par(mfrow=c(1,1),oma=rep(.1,4),mai=c(.85,.9,.1,.1),cex=.8)

png(restoreConsole = TRUE,file="plot1.png",width=480, height=480,type="cairo-png")
plot1<-
with(data = power.1, hist(as.numeric(Global_active_power)*.001,xlab="Global Active Power, (kilowatts)",ylab="Frequency",col="red",main="",plot=TRUE),title(main="Global Active Power"))

dev.off()

par(mai=c(.5,.9,.1,.1))

png(file="plot2.png",width=480, height=480)
plot2<-
  with(data = power.1, plot(as.numeric(Global_active_power), x=datetime, ylab="Global Active Power, kilowats",xlab="",main="",type="l"))
dev.off()

png(file="plot3.png",width=480, height=480)
plot3<-
  with(data=power.1,plot(y=as.numeric(Sub_metering_1),x=datetime,ylab="Energy sub metering",xlab="",col="grey9",type="l"))+
  with(data=power.1,lines(y=as.numeric(Sub_metering_2),x=datetime,col="red",type="l"))+
  with(data=power.1,lines(y=as.numeric(Sub_metering_3),x=datetime,col="blue",type="l"))+
  legend("topright",legend=paste("Sub_metering_",1:3,sep=""),col=c("grey9","red","blue"),lty=1, cex=.9)
dev.off()

png(file="plot4.png",width=480, height=480)
par(mfrow=c(2,2), oma=c(.1,.1,.0,.1)*5, mar=c(.1,.1,.0,.1)*5, mai=c(.4,.7,.4,.1),cex=.5)
plot2<- with(data = power.1, plot(as.numeric(Global_active_power), x=datetime, ylab="Global Active Power",xlab="",main="",type="l"))
plot4<- with(data=power.1,plot(y=as.numeric(Voltage),x=datetime,xlab="datetime",ylab="Voltage",type="l",cex=.5))
plot3<-
  with(data=power.1,plot(y=as.numeric(Sub_metering_1),x=datetime,ylab="Energy sub metering",xlab="",col="grey9",type="l",cex=.7))+
  with(data=power.1,lines(y=as.numeric(Sub_metering_2),x=datetime,col="red",type="l",cex=.7))+
  with(data=power.1,lines(y=as.numeric(Sub_metering_3),x=datetime,col="blue",type="l",cex=.7))+
  legend("topright",legend=paste("Sub_metering_",1:3,sep=""),col=c("grey9","red","blue"),lty=1,bty="n",cex=.7)
plot5<- with(data=power.1,plot(y=as.numeric(Global_reactive_power),x=datetime,xlab="datetime",ylab="Global_reactive_power",type="l",cex=.5))

dev.off()

#save working.space####
dir.create(paste(getwd(),"/working.environment",sep=""))
setwd(paste(getwd(),"/working.environment",sep=""))
save.image(paste(getwd(),"/working.environment.RData",sep=""))
rm(list=ls())
q("no",1,FALSE)
