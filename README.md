# Data-Science Project

# Regression 1 : MentalHealth = a*IncomeInequality + b*wages + c*Unemployment + d*JobQuality + e*WorkTime

# Open/Read files
MentalHealth <- read.csv("share-with-mental-and-substance-disorders.csv")
attach(MentalHealth)
IncomeInequality <- read.csv("Income inequality.csv")
attach(IncomeInequality)
wages <- read.csv("Average wages.csv")
attach(wages)
Unemployment <- read.csv("Unemployement Rate.csv")
attach(Unemployment)
JobQuality <- read.csv("Job Quality.csv")
attach(JobQuality)
WorkTime <- read.csv("Avg work time per country.csv")
attach(WorkTime)

# Data sorting 
data_1 <- IncomeInequality[,-c(2:5,8)]
View(data_1)
data_2 <- wages[,-c(2:5,8)]
View(data_2)
data_3 <- Unemployment[,-c(2:5,8)]
View(data_3)

# Tables merge 
total <- merge(data_1, data_2, data_3, by=c("LOCATION","TIME"))
View(total)
