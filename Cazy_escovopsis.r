input<-read.csv("cazy.csv", header=TRUE)
attach(input)

highcultivar=subset(input,cultivar=="H")
attach(highcultivar)
plot(average, Escovopsis, ylim=c(0,50), xlim=c(0,50), col="black", bg="orange", pch=21, cex=1.5)

lowcultivar=subset(input, cultivar!="H")
attach(lowcultivar)

points(average, Escovopsis, cex=1.5)