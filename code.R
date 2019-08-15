at <- dat[ , colSums(is.na(dat)) == 0]
ncol(dat)
cols<-ncol(dat)
library(moments)
library(dplyr)
library(plyr)
library(data.table)
library(plotly)
library(matrixStats)
##sgn(PRET)
#2017 Return
st <- which(dat[,1]=="2017-01-03")
en <- which(dat[,1]=="2017-12-26")
ret1 <-(dat[en,2:645]-dat[st,2:645])/dat[st,2:645]
ret1 <- ret1[ , colSums(is.na(ret1)) == 0]
ret1<-round(t(ret1),4)
pret<-sign(ret1) #sign of annual return
ncol(pret)
#6M-ID
st <- which(dat[,1]=="2016-07-01")
en <- which(dat[,1]=="2016-12-30")
rp1 <- (dat[(st+1):en,2:cols]-dat[st:(en-1),2:cols])/dat[st:(en-1),2:cols]
m6ret <-(dat[en,2:cols]-dat[st,2:cols])/dat[st,2:cols]
m6ret
m6ret<-t(m6ret)
rp1 <- rp1[ , colSums(is.na(rp1)) == 0]
ncol(rp1)
rows <-en-st #number of rows 6m
s1<-sign(rp1)#sign of all daily returns 6m
ncol(rp1)#col 6m
nrow(rp1)#row 6m
pos <- colSums(s1[2:645]>0)/rows
neg <- colSums(s1[2:645]<0)/rows
ID1 <-pret*(neg-pos)
ncol(ID1)
#3month return
dat <-read.csv("DataP.csv")
dat <- dat[ , colSums(is.na(dat)) == 0]
cols<-ncol(dat)
st <- which(dat[,1]=="2017-01-04")
en <- which(dat[,1]=="2017-03-31")
m3a <-(dat[en,2:cols]-dat[st,2:cols])/dat[st,2:cols]
m3a <- m3a[ , colSums(is.na(m3a)) == 0]
ncol(m3a)
idValue <- t(ID1)
Return <- t(m3a)
plot(var1[idValue>0],Return[idValue>0])
rp1<-as.matrix(sapply(rp1, as.numeric))  
var1<-colVars(rp1)
data.frame(var1)
mi <- c(min(Return),min(var1),min(idValue))
q25 <-c(quantile(Return,prob=0.25) ,quantile(var1,prob=0.25),quantile(idValue,prob=0.25) )
q50 <-c(quantile(Return,prob=0.50) ,quantile(var1,prob=0.50),quantile(idValue,prob=0.50) )
q75 <-c(quantile(Return,prob=0.75) ,quantile(var1,prob=0.75),quantile(idValue,prob=0.75) )
mx <- c(max(Return),max(var1),max(idValue))
?dimnames
samp <- rbind(mi,q25,q50,q75,mx)
samp <-round(samp, 6)
data <- cbind(Return,idValue,var1,m6ret)
data <- data.frame(Return,idValue,var1,m6ret)
data
#Monthly Momentum
st <- which(dat[,1]=="2016-07-01")
en <- which(dat[,1]=="2016-09-30")
rm3 <- (dat[(st+1):en,2:cols]-dat[st:(en-1),2:cols])/dat[st:(en-1),2:cols]
m3ret <-(dat[en,2:cols]-dat[st,2:cols])/dat[st,2:cols]
m3ret<-t(m3ret)
rp1<- rp1[ , colSums(is.na(rp1)) == 0]
ncol(rm3)
rows <-en-st #number of rows 6m
m1<-sign(rm3)#sign of all daily returns 6m
write.csv(m1,file="m1.csv")
ncol(rp1)#col 6m
nrow(m1)#row 6m
pos <- colSums(m1[2:645]>0)/rows
neg <- colSums(m1[2:645]<0)/rows
IDm3 <-pret*(neg-pos)
ncol(IDm3)
IDm3<-t(IDm3)
st <- which(dat[,1]=="2016-09-30")
en <- which(dat[,1]=="2016-12-30")
rm3a <- (dat[(st+1):en,2:cols]-dat[st:(en-1),2:cols])/dat[st:(en-1),2:cols]
m3reta <-(dat[en,2:cols]-dat[st,2:cols])/dat[st,2:cols]
m3reta
m3reta<-t(m3reta)
rp1<- rp1[ , colSums(is.na(rp1)) == 0]
ncol(rm3a)
rows <-en-st #number of rows 6m
m1a<-sign(rm3a)#sign of all daily returns 6m
pos <- colSums(m1a[2:645]>0)/rows
neg <- colSums(m1a[2:645]<0)/rows
IDm3a <-pret*(neg-pos)
ncol(IDm3a)
IDm3a<-t(IDm3a)
IDtot<- IDm3 + IDm3a
#small ID = continuous information
mnID<-mean(idValue)
qval1<-quantile(idValue,prob=0.1)
qv9<-quantile(idValue,prob=0.9)
qvar9<-quantile(var1,prob=0.9)
qvar1<-quantile(var1,prob=0.1)
sdv1<-sd(idValue)+abs(mean(idValue))
sdv2<-sd(idValue)+mean(idValue)
######
plot(idValue,Return,type="p", xlim=c(-.35,.2), ylim=c(-.5,.5))
points(idValue[idValue< -0.1746],Return[idValue< -0.1746],col=4,pch=16)  
points(idValue[var1>qvar9],Return[var1>qvar9],col="red",pch=16)#ID >mean 
points(idValue[idValue>sdv1],Return[idValue>sdv1],col="red",pch=16)
points(idValue[idValue> mnID],Return[idValue> mnID],col="white",pch=16)     #ID < 10%   #var <25%
points(idValue[var1<qvar1],Return[var1<qvar1],col=4,pch=16)     #var <10%
abline(h = 0, v = 0, col = "gray60")
###########################
data <- data.frame(Return,idValue,var1,m6ret,IDm3,IDm3a,IDtot)
write.csv(data,file="data.frame.csv")
plot(idValue,Return,type="p", xlim=c(-.35,.2), ylim=c(-.5,.5))
abline(h = 0, v = 0, col = "gray60")
points(idValue[idValue< -0.1746],Return[idValue< -0.1746],col=4,pch=16)
points(idValue[idValue> mnID],Return[idValue> mnID],col="white",pch=16) 
points(idValue[var1>qvar9],Return[var1>qvar9],col="red",pch=16)#ID >mean 
points(idValue[idValue>sdv1],Return[idValue>sdv1],col="red",pch=16)
points(idValue[idValue> mnID],Return[idValue> mnID],col="white",pch=16)     #ID < 10%   #var <25%
points(idValue[var1<qvar1],Return[var1<qvar1],col=4,pch=16) 
#####################################################################################
plot(idValue,Return,type="p", xlim=c(-.35,.2), ylim=c(-.5,.5))
abline(h = 0, v = 0, col = "gray60")
points(idValue[idValue < IDm3],Return[idValue< IDm3],col=3,pch=16) 
points(idValue[var1<qvar1],Return[var1<qvar1],col=4,pch=16)  
points(idValue[idValue>qv9],Return[idValue>qv9],col="white",pch=16)
points(idValue[var1>qvar9],Return[var1>qvar9],col="red",pch=16)#ID >mean 
points(idValue[var1<qvar1],Return[var1<qvar1],col=4,pch=16)     #var <10%
points(idValue[idValue> mnID],Return[idValue> mnID],col="white",pch=16) 
abline(h = 0, v = 0, col = "gray60")
######################################################################################
samp
points(idValue[var1<qvar1],Return[var1<qvar1],col=4,pch=16) #best 10%
data <- data.frame(Return,idValue,var1,m6ret,IDm3,IDm3a,IDtot)
par(mfrow=c(1,1))
X <- idValue   #draw var 1
Y <- Return   #draw var 2
plot(X, Y, xlim=c(-.35,.2), ylim=c(-.5,.5),
     col=ifelse(((var1<qvar1 & idValue<qval1)),"blue", "black"),
     main="Two Dimensional Outliers (in red)" ,
     pch=ifelse(((var1<qvar1 & idValue<qval1)), 16, 1)
)
points(idValue,Return)
abline(h = 0, v = 0, col = "gray60")
points(idValue,Return,
col=ifelse(((var1>qvar9 & idValue>qv9)),"red", "black"),
       main="Two Dimensional Outliers (in red)" ,
       pch=ifelse(((var1>qvar9 & idValue>qv9)), 16, 1)
)
points(idValue,Return,
       
       col=ifelse(((var1>qvar9 & m6ret<0)),"red", "black"),
       main="Two Dimensional Outliers (in red)" ,
       pch=ifelse(((var1>qvar9 & m6ret<0)), 16, 1)
)
References:
