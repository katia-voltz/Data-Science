# Data-Science Project
library(plyr)

# Regression 1 : MentalHealth = a*IncomeInequality + b*wages + c*Unemployment + d*JobQuality + e*WorkTime

# Open/Read files
Mental_Health <- read.csv("share-with-mental-and-substance-disorders.csv")
attach(MentalHealth)
Income_Inequality <- read.csv("Income inequality.csv")
attach(IncomeInequality)
Salary <- read.csv("Average wages.csv")
attach(wages)
Unemployment <- read.csv("Unemployement Rate.csv")
attach(Unemployment)
Job_Quality <- read.csv("Job Quality.csv")
attach(JobQuality)
Work_Time <- read.csv("Avg work time per country.csv")
attach(WorkTime)

# Data sorting 
Income_Inequality <- IncomeInequality[,-c(2:5,8)]
View(data_1)
Salary <- Salary[,-c(2:5,8)]
View(data_2)
Unemployment <- Unemployment[,-c(2:5,8)]
View(data_3)
Job_Quality <- Job_Quality[,-c(2:12,14:20,22,23)]
View(data_4)
Work_time <- Avg.work.time.per.country[,-c(2:7,9:14,16:17)]
View(data_5)
Work_time <- rename(Work_time,"Country"="LOCATION")
View(data_5.2)
data_6 <- Mental_Health[,-1]
View(data_6)
data_6.2 <- rename(data_6,c("Code"="LOCATION", "Year"="TIME"))
View(data_6.2)

# Tables merge 
total <- merge(data_1, data_2, by=c("LOCATION","TIME"))
View(total)

# Regression 2.1 : MentalHealth = a*Number_Covid-19_cases + b*Number_Covid-19_Death
# Regression 2.2 : MentalHealth = a*Teleworking + b*Unemployment
# Regression 3 : MentalHealth = a*Invesment 
