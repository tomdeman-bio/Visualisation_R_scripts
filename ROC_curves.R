#source activate rtest

require(MASS)
require(plotROC)
require(ROCit)
library(epiDisplay)
#https://stats.stackexchange.com/questions/8661/logistic-regression-in-r-odds-ratio

setwd("~/Documents/ARAC_studies/Nasal_microbiome/Persistent_carrier_study/Analysis/Logit_reg_model")

###########
#look at all indicator species
inputData <- read.table("Sample_sex_carrierstatusP-IN_indicator_spp_logplusone_unix.txt", sep="\t", header=T)
summary(inputData)


##############
#only look at S aureus
myvars <- c("Sample_ID", "Sex", "Carrier_status_V2", "Staphylococcusaureus")
inputDataSA <- inputData[myvars]
summary(inputDataSA)
#log transform Staph values
#inputDataSA[, 4] <- log10(inputDataSA[4])



#ROC curves - second one for Youden Index calculation
ggplot(inputDataSA, aes(d = Carrier_status_V2, m = Staphylococcusaureus)) + geom_roc() + scale_y_continuous(breaks=seq(0, 1, 0.20)) + scale_x_continuous(breaks=seq(0, 1, 0.20))
#second plot for Youden Index location
ROCit_obj <- rocit(score=inputDataSA$Staphylococcusaureus ,class=inputDataSA$Carrier_status_V2)
plot(ROCit_obj, values = TRUE, YIndex = TRUE)
ROC_object<-plot(ROCit_obj, values = TRUE, YIndex = TRUE)
ROC_object$`optimal Youden Index point`
#youden index: 46150 (0.74 TPR and 0.12 FPR) AUC: 0.86



maleSA <- subset(inputDataSA, inputDataSA$Sex=="male")
femaleSA <- subset(inputDataSA, inputDataSA$Sex=="female")

#ROC curve for just male
ggplot(maleSA, aes(d = Carrier_status_V2, m = Staphylococcusaureus)) + geom_roc() + scale_y_continuous(breaks=seq(0, 1, 0.20)) + scale_x_continuous(breaks=seq(0, 1, 0.20))
#ROC curve for just female
ggplot(femaleSA, aes(d = Carrier_status_V2, m = Staphylococcusaureus)) + geom_roc() + scale_y_continuous(breaks=seq(0, 1, 0.20)) + scale_x_continuous(breaks=seq(0, 1, 0.20))

#Youden for just male
ROCit_obj <- rocit(score=maleSA$Staphylococcusaureus ,class=maleSA$Carrier_status_V2)
plot(ROCit_obj, values = TRUE, YIndex = TRUE)
ROC_object<-plot(ROCit_obj, values = TRUE, YIndex = TRUE)
ROC_object$`optimal Youden Index point`
#youden index: 46150.0 (0.78 TPR and 0.13 FPR) AUC: 0.88

#Youden for just females
ROCit_obj <- rocit(score=femaleSA$Staphylococcusaureus ,class=femaleSA$Carrier_status_V2)
plot(ROCit_obj, values = TRUE, YIndex = TRUE)
ROC_object<-plot(ROCit_obj, values = TRUE, YIndex = TRUE)
ROC_object$`optimal Youden Index point`
#youden index: 72691.4 (0.67 TPR and 0.06 FPR) AUC:0.83
