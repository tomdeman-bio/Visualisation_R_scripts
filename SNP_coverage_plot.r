#create a SNP versus coverage plot for plasmid genome sequences. Also add two boxplots to show spread of X and Y axis 
#input file contains 3 columns; isolate, snp count, coverage in bp

plasmid<-read.csv(file="oxa_48_plot_input_genomecov.csv",head=TRUE,sep=",")
attach(plasmid)
plasmid

specimen <- as.factor(plasmid[,1])

par(fig=c(0,0.8,0,0.8), new=TRUE)
plot(plasmid$SNPs, plasmid$Coverage, pch=unclass(Isolate), xlab="Core SNPs", ylab="Coverage (bp)")
legend(-3.3,64000, legend=levels(Isolate), pch=c(1:15), xpd=TRUE, inset=.05, trace=TRUE)

par(fig=c(0,0.8,0.55,1), new=TRUE)
boxplot(plasmid$SNPs, horizontal=TRUE, axes=FALSE)

par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(plasmid$Coverage, axes=FALSE)
mtext("Plasmid genetic diversity", side=3, outer=TRUE, line=-3)
