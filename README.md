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
data_1 <- wages[,-c(2:5,8)]
view(data_1)

# Tables merge 

