# Data-Science Project

# Importation of different packages

library(plyr)

# Regression 1 : MentalHealth = a*IncomeInequality + b*wages + c*Unemployment + d*JobQuality + e*WorkTime

# Open/Read files

Mental_Health <- read.csv("share-with-mental-and-substance-disorders.csv")
attach(Mental_Health)
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

Income_Inequality <- Income_Inequality[,-c(2:5,8)]
View(Income_Inequality)
Salary <- Salary[,-c(2:5,8)]
View(Salary)
Unemployment <- Unemployment[,-c(2:5,8)]
View(Unemployment)
Job_Quality <- Job_Quality[,-c(2:12,14:20,22,23)]
View(Job_Quality)

# Attention with Work_time: Différente base de données utilisée
Work_time <- Avg.Work.Time[,-c(2:5,8)]
view(Work_time)


Mental_Health <- Mental_Health[,-1]
View(Mental_Health)
data_6.2 <- rename(data_6,c("Code"="LOCATION", "Year"="TIME"))
View(data_6.2)

# Tables merge 
total <- merge(data_1, data_2, by=c("LOCATION","TIME"))
View(total)

# Regression 2.1 : MentalHealth = a*Number_Covid-19_cases + b*Number_Covid-19_Death
# Regression 2.2 : MentalHealth = a*Teleworking + b*Unemployment
# Regression 3 : MentalHealth = a*Invesment 
