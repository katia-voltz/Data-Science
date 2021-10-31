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






# Regression 2 

Antidepressant_consumption <- read.csv("Conso Antidepressant.csv")
attach(Antidepressant_consumption)
View(Antidepressant_consumption)

# Regression 2.1 : Antidepressant_consumption = a*Number_Covid-19_cases + b*Number_Covid-19_Death

Number_Covid19_cases_deaths <- read.csv("Cases + Deaths from Covid-19.csv")
attach(Number_Covid19_cases_deaths)

# Data sorting : remove unwanted columns

# Number_Covid19_cases_deaths <- Number_Covid19_cases_deaths[,-c(2,4:7,9:13)]
# View(Number_Covid19_cases_deaths)
# Remove "Name" column +  remove la 1ère ligne "global" : je sais pas comment faire autrement 

# --> On peut faire comme ca non ?  : 
Number_Covid19_cases_deaths <- Number_Covid19_cases_deaths[,-c(1:2,4:7,9:13)]
Number_Covid19_cases_deaths <- Number_Covid19_cases_deaths[-1,]
View(Number_Covid19_cases_deaths)

# Number_Covid19_cases_deaths_2 <- Number_Covid19_cases_deaths[-1]
# View(Number_Covid19_cases_deaths_2)

# Merge tables
total <- merge(Number_Covid19_cases_deaths_2, Antidepressant_consumption, by="LOCATION")
View(total)



# Regression 2.2 : Antidepressant_consumption = a*Teleworking + b*Unemployment

Teleworking <- read.csv("Teleworking.csv")
attach(Teleworking)
UnemploymentCovid <- read.csv("Unemployment Rate Covid.csv")
attach(UnemploymentCovid)
View(UnemploymentCovid)

# Data sorting : Remove unwanted columns 
Teleworking <- Teleworking[,-c(1:8,12)]
View(Teleworking)
UnemploymentCovid <- UnemploymentCovid[,-c(2:5,8)]
View(UnemploymentCovid)

# Rename columns 
Teleworking <- rename(Teleworking,c("geo"="LOCATION","TIME_PERIOD"="TIME"))
View(Teleworking)






# Regression 3 : MentalHealth = a*Invesment 

library(plyr)

Public.spending.on.health_New<- read.csv2("Public Spending on Health.csv")
View(Public.spending.on.health_New)

#We remove the 3 first rows

Public.spending.on.health_New <- Public.spending.on.health_New[-c(1:3),]
View(Public.spending.on.health_New)
Public.spending.on.health_New <- rename(Public.spending.on.health_New, c('Data.Source' = 'Country', 'World.Development.Indicators' = 'LOCALISATION'))
View(Public.spending.on.health_New)

# We remove the unecessary colomne, with no data corresponding

Public.spending.on.health_New <- Public.spending.on.health_New[,-c(5:45)]
View(Public.spending.on.health_New)

# We remove the unecessary colomne 

Public.spending.on.health_New$X.61 <- NULL
Public.spending.on.health_New$Country <- NULL
Public.spending.on.health_New$X <- NULL
Public.spending.on.health_New$X.1 <- NULL
Public.spending.on.health_New$X.62 <- NULL
Public.spending.on.health_New$X.63 <- NULL
View(Public.spending.on.health_New)

library(tidyverse)
library(dplyr)

Public.spending.on.health_New <- rename(Public.spending.on.health_New, c('X.43' = 2000))
view(Public.spending.on.health_New)

# Would like to re-arrange the position of the years next to the corresponding country, with 'pivot_longer', but problem...

Public.spending.on.health_New %>% pivot_longer(cols
= c('X.43','X:44','X.45','X.46','X.47','X.48','X.49','X.50','X.51','X.52','X.53','X.54','X.55','X.56','X.57','X.58','X.59','X.60'),names_to = 'TIME', values_to = 'value')




