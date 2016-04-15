#load CummeRbund 
library(cummeRbund)
#create CummeRbund database from the Cuffdiff output, cd25 is name of example Cuffdiff directory
cuff_data <- readCufflinks('cd25')
#change coloring in ggplot and add lines
ggplot <- function(...) { ggplot2::ggplot(...) + theme_bw() }
pdf(file='MAplot_control-growtowardsV2.pdf')
p <- MAplot(genes(cuff_data),"f2","f5")
p <- p + geom_point(aes(A, log2(M), colour = factor(ifelse(log2(M) < 2.72, 1,2))), size = 0.8) + geom_hline(yintercept = c(-2.73,2.73)) + theme(legend.position = "none") + scale_colour_manual(values = c("black","red"))
p
dev.off()
