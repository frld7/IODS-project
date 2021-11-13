# Johanna Kukkola 13.11.2021 This is a R script file for IODS week 2.

lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
str(lrn14) # The data frame includes 183 observations of 60 variables. Variable gender is of type chr and the other variables are of type int.
dim(lrn14) # The dimensions are 183, 60

library(dplyr)

# Creating the analysis dataset just like in Datacamp:

lrn14$attitude <- lrn14$Attitude/10

deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

keep_columns <- c("gender","Age","attitude", "deep", "stra", "surf", "Points")

learning2014 <- select(lrn14, one_of(keep_columns))

colnames(learning2014)[2] <- "age"
colnames(learning2014)[7] <- "points"

str(learning2014)
# Everything looks good

learning2014 <- filter(learning2014, points > 0)

dim(learning2014) # 166, 7

getwd() # Checking what the working directory is, it already was the project folder

write.table(learning2014, 'data/learning2014.txt')

learning2014_from_file <- read.table('data/learning2014.txt')

str(learning2014_from_file)
head(learning2014_from_file)
# Everything looks right

