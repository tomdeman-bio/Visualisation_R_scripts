my.df1 <- data.frame(Saureus = c("<10^4", "10^4 <10^5", "10^5 <10^6", ">10^6"),
                    P = c(0.35,0.54,0.73,1),
                    IN = c(0.65,0.46,0.27,0))

barplot(t(as.matrix(my.df1[, 2:3])),
        beside = TRUE,
        names.arg = my.df1$Saureus,
        ylim = c(0,1),
        ylab = "Proportion",
        xlab = "S. aureus absolute abundance",
        legend.text = TRUE,
        args.legend = list(x="topleft")
)

my.df2 <- data.frame(Saureus = c("<10^4", "10^4 <10^5", "10^5 <10^6", ">10^6"),
P_male = c(7, 5, 5, 15),
P_female = c(6, 2, 3, 7),
IN_male = c(11, 3, 2, 0),
IN_female = c(13, 3, 1, 0))

barplot(t(as.matrix(my.df2[, 2:5])),
        beside = TRUE,
        names.arg = my.df2$Saureus,
        ylim = c(0,20),
        ylab = "Number of individuals",
        xlab = "S. aureus absolute abundance",
        legend.text = TRUE,
        args.legend = list(x="topleft")
)
