# Johanna Kukkola 12.12.2021 This is a R script file for IODS week 6.

BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep=" ", header=TRUE)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep="\t", header=TRUE)

names(BPRS)
str(BPRS)
dim(BPRS) # 40  11
summary(BPRS)

names(RATS)
str(RATS)
dim(RATS) # 16 13
summary(RATS)

library(dplyr)
library(tidyr)

BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

RATS$ID <- factor(RATS$ID)
RATS$Group <- factor(RATS$Group)
RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4))) 

names(BPRSL)
str(BPRSL)
dim(BPRSL) # 360   5
summary(BPRSL)
glimpse(BPRSL)

names(RATSL)
str(RATSL)
dim(RATSL) # 176   5
summary(RATSL)
glimpse(RATSL)

write.table(BPRSL, 'data/BPRSL.txt')
write.table(RATSL, 'data/RATSL.txt')
