##########Written By Liam Flaherty For ST503 HW1##########
#####1. Load Required Packages#####
install.packages("faraway")
library(faraway)
summary(teengamb)                     #Get a glimpse of the data#
str(teengamb)                         #get a glimpse of the data#

#From ?faraway--
#sex is 0 male, 1 female,
#status is socioeconomic status score based on parents' occupation#
#income is in pounds per week#
#verbal is score out of 12 words#
#gamble is expenditure on gambling in pounds per year#





#####2. Simple Data Visualization#####
boxplot(teengamb$income, teengamb$gamble/12,                       #Show income and expenses together#
        names=c("Income (Per Week)",                               #Can't use xlab#
                "Gambling Expenditures (Per Month)"),                
        ylab="British Pounds",
        col=c("green", "red"),                                     
        main="Teenage Income And Spending Habits In Britian")

par(mfrow=c(1,2))                                                  #Show 4 plots together#

plot(density(teengamb$status),                                     #Just for variety, hist likely better#
     main="Parental Socioeconomic Status",
     xlab="SES Score", ylab="Density")
polygon(density(teengamb$status), col="gold")                      #fill in for effect#

hist(teengamb$verbal, main="Verbal Definition Score (Out Of 12)",         
     xlab="Score", ylab="Frequency", col="blue")
par(mfrow=c(1,1))                                                  #Put plots back to normal#





#####3. Regression#####
out=lm(teengamb$gamble ~ teengamb$income)                          #response (y) ~ predictor (x)#
out






#####4. Sex  Breakdown#####
number.males=sum(teengamb$sex==0)                                  #count total males#
number.females=sum(teengamb$sex==1)                                #count total females#

male=data.frame(c("mean", "standard deviation"),                   #dummy column#
                rbind(                                             #stack rows on top of each other#
                  sapply(teengamb[which(teengamb$sex==0),], mean),   #mean of each column, filtered to males#
                  sapply(teengamb[which(teengamb$sex==0),], sd)      #sd of each column, filtered to males#
                ))
names(male)=c(paste0("MALE", "(n=", number.males, ")"),            #rename first colummn#
              names(male)[2:ncol(male)])                   

female=data.frame(c("mean", "standard deviation"),                 #dummy column#
                  rbind(                                           #stack rows on top of each other#
                    sapply(teengamb[which(teengamb$sex==1),], mean), #mean of each column, filtered to females#
                    sapply(teengamb[which(teengamb$sex==1),], sd)    #sd of each column, filtered to females#
                  ))
names(female)=c(paste0("FEMALE", "(n=", number.females, ")"),      #rename first colummn#
                names(female)[2:ncol(female)])          

male
female




#####5. Sex Differences Income/Spending Regression#####
maledf=teengamb[which(teengamb$sex==0),]                           #filter to only males#
femaledf=teengamb[which(teengamb$sex==1),]                         #filter to only females#

maleout=lm(maledf$gamble ~ maledf$income)                          #response(y) ~ predictor(x)#
maleslope=maleout[[1]][[2]]                                        #just get numeric output#
maleintercept=maleout[[1]][[1]]                                    #just get numeric output#

femaleout=lm(femaledf$gamble ~ femaledf$income)
femaleslope=femaleout[[1]][[2]]
femaleintercept=femaleout[[1]][[1]]

plot(teengamb$income, teengamb$gamble,                             #predictor(x), response(y)#
     pch=ifelse(teengamb$sex==0, 17, 16),                          #pch is shape of datapoints#
     col=ifelse(teengamb$sex==0, "blue", "hotpink"),               #col differentiates between male female#
     main="Relationship Between Income And Gambling",              
     xlab="Income (Weekly)",
     ylab="Gambling Expenditures (Annually)")
abline(maleintercept, maleslope, col="blue", lwd=2, lty=2)         #add male regression line. lwd is width#
abline(femaleintercept, femaleslope, col="hotpink", lwd=2, lty=2)  #add female reg line. lty is dashed#
legend("topleft", legend=c("Male", "Female"),
       fill=c("blue", "hotpink"))

