library(readr)

#Total Duration of opioid use 

catData <- read.csv("SAS_data/catData.csv")

weightedPercentage<-as.numeric(catData[1,])
barLabel<-round(weightedPercentage, digits = 2)
bb=barplot(weightedPercentage,axis.lty=1,ylim=c(0,80),xlim=c(0,21),
           main=("Duration of Postpartum Opioid Use"),
        xlab = "Duration of Opioid Use (Weeks)",
        ylab = "Weighted Percentage",
        names.arg = c("0", "<1 week", "1", "2", "3", "4", "5","6","8","10","12","13","14","16","24","28","32","36"))
text(bb,weightedPercentage+1.5,labels=barLabel,cex=.8)

#Within 20 weeks 

bb4=barplot(weightedPercentage[1:14],axis.lty=1,ylim=c(0,80),xlim=c(0,16),
           main=("Duration of Postpartum Opioid Use Within 20 Weeks"),
           xlab = "Duration of Opioid Use (Weeks)",
           ylab = "Weighted Percentage",
           names.arg = c("0", "<1 week", "1", "2", "3", "4", "5","6","8","10","12","13","14","16"))
text(bb4,weightedPercentage[1:14]+1.5,labels=barLabel[1:14],cex=.8)


#truncate 4 weeks or more to one variable 
fourWksMore=c(weightedPercentage[1:5],sum(weightedPercentage[6:18]))
barLabelfour<-round(fourWksMore, digits = 2)
bb4more=barplot(fourWksMore,axis.lty=1,ylim=c(0,80),xlim=c(0,8),
            xlab = "Duration of Opioid Use After Delivery (Weeks)",
            ylab = "Weighted Percentage",
            names.arg = expression("0", "<1 week", "1", "2", "3", "" >= "4 weeks"))
text(bb4more,fourWksMore+1.5,labels=barLabelfour,cex=.8)



#cesarean delivery 
#total 
ccatData <- read.csv("SAS_data/ccatData.csv")
cweightedPercentage<-as.numeric(ccatData[1,])
cbarLabel<-round(cweightedPercentage, digits = 2)
cbb=barplot(cweightedPercentage,axis.lty=1,ylim=c(0,70),xlim=c(0,21),
           main=("Duration of Postpartum Opioid Use Among Individuals With Cesarean Delivery"),
           xlab = "Duration of Opioid Use (Weeks)",
           ylab = "Weighted Percentage",
           names.arg = c("0", "<1 week", "1", "2", "3", "4", "5","6","8","10","12","13","14","16","24","28","32","36"))
text(cbb,cweightedPercentage+1.5,labels=cbarLabel,cex=.8)

###within 20 weeks 
cbb4=barplot(cweightedPercentage[1:14],axis.lty=1,ylim=c(0,70),xlim=c(0,16),
            main=("Duration of Postpartum Opioid Use Within 20 Weeks Among Individuals With Cesarean Delivery"),
            xlab = "Duration of Opioid Use (Weeks)",
            ylab = "Weighted Percentage",
            names.arg = c("0", "<1 week", "1", "2", "3", "4", "5","6","8","10","12","13","14","16"))
text(cbb4,cweightedPercentage[1:14]+1.5,labels=cbarLabel[1:14],cex=.8)

###Truncated more than 4 weeks 
cfourWksMore=c(cweightedPercentage[1:5],sum(cweightedPercentage[6:18]))
cbarLabelfour<-round(cfourWksMore, digits = 2)
cbb4more=barplot(cfourWksMore,axis.lty=1,ylim=c(0,100),xlim=c(0,8),
                xlab = "Duration of Opioid Use After Cesarean Delivery (Weeks)",
                ylab = "Weighted Percentage",
                names.arg = expression("0", "<1 week", "1", "2", "3", "" >= "4 weeks"))
text(cbb4more,cfourWksMore+1.5,labels=cbarLabelfour,cex=.8)


###Vaginal Delivery 
vcatData <- read.csv("SAS_data/vcatData.csv")
#total
vweightedPercentage<-as.numeric(vcatData[1,])
vbarLabel<-round(vweightedPercentage, digits = 2)
vbb=barplot(vweightedPercentage,axis.lty=1,ylim=c(0,100),xlim=c(0,21),
            main=("Duration of Postpartum Opioid Use Among Individuals With Vaginal Delivery"),
            xlab = "Duration of Opioid Use (Weeks)",
            ylab = "Weighted Percentage",
            names.arg = c("0", "<1 week", "1", "2", "3", "4", "5","6","8","10","12","13","14","16","24","28","32","36"))
text(vbb,vweightedPercentage+2,labels=vbarLabel,cex=.8)

#within 20 weeks
vbb4=barplot(vweightedPercentage[1:11],axis.lty=1,ylim=c(0,100),xlim=c(0,13),
             main=("Duration of Postpartum Opioid Use Within 20 Weeks \n Among Individuals With Vaginal Delivery"),
             xlab = "Duration of Opioid Use (Weeks)",
             ylab = "Weighted Percentage",
             names.arg = c("0", "<1 week", "1", "2", "3", "4", "5","6","8","10","12"))
text(vbb4,vweightedPercentage[1:11]+2,labels=vbarLabel[1:11],cex=.8)


###Truncated more than 4 weeks 
vfourWksMore=c(vweightedPercentage[1:5],sum(vweightedPercentage[6:18]))
vbarLabelfour<-round(vfourWksMore, digits = 2)
vbb4more=barplot(vfourWksMore,axis.lty=1,ylim=c(0,100),xlim=c(0,8),
                 xlab = "Duration of Opioid Use After Vaginal Delivery (Weeks)",
                 ylab = "Weighted Percentage",
                 names.arg = expression("0", "<1 week", "1", "2", "3", "" >= "4 weeks"))
text(vbb4more,vfourWksMore+2,labels=vbarLabelfour,cex=.8)

#combined bar plot1 
layout(matrix(c(1, 2), nrow = 1, byrow = TRUE), heights= c(1, 2))
vbb4more=barplot(vfourWksMore,axis.lty=1,ylim=c(0,100),xlim=c(0,8),
                 xlab = "Duration of Opioid Use After Vaginal Delivery (Weeks)",
                 ylab = "Weighted Percentage",
                 names.arg = expression("0", "<1 week", "1", "2", "3", "" >= "4 weeks"))
text(vbb4more,vfourWksMore+2,labels=vbarLabelfour,cex=.8)
title("A", adj = 0)

cbb4more=barplot(cfourWksMore,axis.lty=1,ylim=c(0,100),xlim=c(0,8),
                 xlab = "Duration of Opioid Use After Cesarean Delivery (Weeks)",
                 ylab = "Weighted Percentage",
                 names.arg = expression("0", "<1 week", "1", "2", "3", "" >= "4 weeks"))
text(cbb4more,cfourWksMore+1.5,labels=cbarLabelfour,cex=.8)
title("B", adj = 0)

