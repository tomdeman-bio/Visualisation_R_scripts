library(RColorBrewer)
qualitative <- brewer.pal(11, "Set3")

#load in example data
input <- read.table(file="Microbe_data.txt",head=TRUE,sep="\t")
attach(input)
input

#use line below and last line when not wanting to show plot on R screen
#pdf(file='OTU_composition_visits_individuals.pdf')

#create space for the plot
par(mfrow=c(1,2))
par(mar=c(5,4,4,0) + 0.1)

#plot the data
x <- as.matrix(input[-1])   
barplot(t(x), col = qualitative, ylab = "Relative abundance", main = "OTU composition", las = 3)

#place labels under the bars
mtext("V1-Control",line=1,side=1,at=7.5,las=2)
mtext("V2-Control",line=1,side=1,at=25,las=2)
mtext("V1-CRAI",line=1,side=1,at=53,las=2)
mtext("V2-CRAI",line=1,side=1,at=93,las=2)
#grouping lines
axis(1,at=c(0.5,1,2,3,15.5),col="red",line=0.5,tick=T,labels=rep("",5),lwd=3,lwd.ticks=0)
axis(1,at=15.5+c(0.5,1,2,3,20),col="blue",line=0.5,tick=T,labels=rep("",5),lwd=3,lwd.ticks=0)
axis(1,at=35.5+c(0.5,1,2,3,35),col="red",line=0.5,tick=T,labels=rep("",5),lwd=3,lwd.ticks=0)
axis(1,at=70.5+c(0.5,1,2,3,41),col="blue",line=0.5,tick=T,labels=rep("",5),lwd=3,lwd.ticks=0)

#create space for the legend outside the plot
par(mar=c(5,0,4,1) + 0.1)
plot(x, axes = FALSE, ann = FALSE, type = "n")	

#the legend
legend("topleft", 
legend = c("Other", "Enterobacteriaceae", "Alcaligenaceae", "Erysipelotrichaceae", "Tissierellaceae", "Veillonellaceae", "Ruminococcaceae", "Lachnospiraceae", "Streptococcaceae","Prevotellaceae","Bacteroidaceae"),
fill = qualitative [11:1], title = "Family")

#dev.off()