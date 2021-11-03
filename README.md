# Data-Science Project

# Importation of different packages

library(plyr)

# Regression 1 : MentalHealth = a*IncomeInequality + b*wages + c*Unemployment + d*JobQuality + e*WorkTime

# Open/Read/Sort files

Mental_Health <- read.csv("Mental Health.csv")
attach(Mental_Health)
Mental_Health <- Mental_Health[,-1]
Mental_Health <- rename(Mental_Health,c("LOCATION"="Code", "TIME"="Year"))
View(Mental_Health)

Income_Inequality <- read.csv("Income inequality.csv")
attach(Income_Inequality)
Income_Inequality <- Income_Inequality[,-c(2:5,8)]
Income_Inequality <- rename(Income_Inequality,c("Value"="Value_x1"))
View(Income_Inequality)

wages <- read.csv("Average wages.csv")
attach(wages)
wages <- wages[,-c(2:5,8)]
wages <- rename(wages,c("Value"="Value_x2"))
View(wages)

Unemployment <- read.csv("Unemployement Rate.csv")
attach(Unemployment)
Unemployment <- Unemployment[,-c(2:5,8)]
Unemployment <- rename(Unemployment,c("Value"="Value_x3"))
View(Unemployment)

Job_Quality <- read.csv("Job Quality.csv")
attach(Job_Quality)
Job_Quality <- Job_Quality[,-c(2:12,14:20,22,23)]
Job_Quality <- rename(Job_Quality,c("Value"="Value_x4"))
View(Job_Quality)

Work_Time <- read.csv("Avg Work Time.csv")
attach(Work_Time)
Work_Time <- Work_Time[,-c(2:5,8)]
Work_Time <- rename(Work_Time,c("Value"="Value_x5"))
View(Work_Time)

# Tables merge 

# ca sort le tableau et j'ai l'impression qu'il est juste mais le code est clairement pas ouf, il faut l'améliorer + Il y a pas les valeurs de Mental Health

tab_0 <- full_join(Mental_Health, Income_Inequality, by = c("LOCATION", "TIME"))
tab_1 <- full_join(tab_0, wages, by = c("LOCATION", "TIME"))
tab_2 <- full_join(tab_1, Unemployment, by = c("LOCATION", "TIME"))
tab_3 <- full_join(tab_2, Job_Quality, by = c("LOCATION", "TIME"))
tab_R1 <- full_join(tab_3, Work_Time, by = c("LOCATION", "TIME"))
tab_R1 <- rename(tab_R1, c("Value_y"="Prevalence...Mental.and.substance.use.disorders...Sex..Both...Age..Age.standardized..Percent.","Value_x1"="Value.x","Value_x2"="Value.y","Value_x3"="Value.x.x","Value_x4"="Value.y.y","Value_x5"="Value"))
View(tab_R1)

# Regression study

library(corrplot)
library(ggplot2)

tab_3 <- as.numeric(as.character[1])
cor(as.matrix (tab_3[,-1]))
Reg_2.1 <- lm()





# Regression 2 

Antidepressant_consumption <- read.csv("Conso Antidepressant.csv")
attach(Antidepressant_consumption)
Antidepressant_consumption <- Antidepressant_consumption[,-c(1:4,6:7,10:11)]
Antidepressant_consumption <- rename(Antidepressant_consumption,c("LOCATION"="COU","TIME"="Year"))
# Séléctionner que les données pour 2020 pour coller avec Nb covid cases and deaths 
View(Antidepressant_consumption)


# Regression 2.1 : Antidepressant_consumption = a*Number_Covid19_cases + b*Number_Covid-19_Death

Number_Covid19_cases_deaths <- read.csv("Cases + Deaths from Covid-19.csv")
attach(Number_Covid19_cases_deaths)
Number_Covid19_cases_deaths <- Number_Covid19_cases_deaths[,-c(1:2,4:7,9:13)]
Number_Covid19_cases_deaths <- Number_Covid19_cases_deaths[-1,]
# Problème parce que les pays sont écrit en entier (pas le bon format)
Number_Covid19_cases_deaths <- rename(Number_Covid19_cases_deaths, "LOCATION"="?")
View(Number_Covid19_cases_deaths)

# Merge tables
tab_R2.1 <- full_join(Number_Covid19_cases_deaths, Antidepressant_consumption, by = c("LOCATION"))
View(tab_R2.1)




# Regression 2.2 : Antidepressant_consumption = a*Teleworking + b*Unemployment

Teleworking <- read.csv("Teleworking.csv")
attach(Teleworking)
Teleworking <- Teleworking[,-c(1:8,12)]
Teleworking <- rename(Teleworking,c("LOCATION"="geo","TIME"="TIME_PERIOD","Value_x1"="OBS_VALUE"))
View(Teleworking)

UnemploymentCovid <- read.csv("Unemployment Rate Covid.csv")
attach(UnemploymentCovid)
UnemploymentCovid <- UnemploymentCovid[,-c(2:5,8)]
# Les dates ne sont pas dans le bon format
UnemploymentCovid <- rename(UnemploymentCovid, c("Value_x2"="Value"))
View(UnemploymentCovid)


# Merge tables 
tab <- full_join(Antidepressant_consumption, Teleworking, by=c("LOCATION", "TIME"))
tab_R2.2 <- full_join(tab, UnemploymentCovid, by = c("LOCATION", "TIME"))
View(tab_R2.2)




# Regression 3 : MentalHealth = a*Invesment 

library(plyr)
library(tidyverse)
library(dplyr)


# Mental_Health <- read.csv('share.with.mental.and.substance.disorders')
### Importation des données pout Mental_Health


Mental_Health <- Mental_Health[,-1]
view(Mental_Health)

# On renomme les variable de Year avec Time. Par contre j'arrive pas a renommer celle de Prevalence...

Mental_Health <- Mental_Health %>%
  rename(Time=Year)
  
Mental_Health <- Mental_Health %>%
  rename(LOCATION=Code)

Metal_Health <- Mental_Health %>%
  rename(Mental_health_value = Prevalence...Mental.and.substance.use.disorders...Sex..Both...Age..Age.standardized..Percent.)

# On filtre les données par années allant de 2000 jusqu'a 2018

Mental_Health <- Mental_Health %>%
  group_by(Code,Prevalence...Mental.and.substance.use.disorders...Sex..Both...Age..Age.standardized..Percent.) %>%
  filter(Time>1999)

View(Mental_Health)  
  
#On selectionne que les pays de la liste

Mental_Health <- Mental_Health %>%
  filter(LOCATION == 'AFG')

View(Mental_Health)





# PROBLEM AVEC COLONNES SUPPRIMEES

# Public.spending.on.health 

library(plyr)

Public.spending.on.health<- read.csv2("Public Spending on Health.csv")

Public.spending.on.health_New<- Public.spending.on.health
View(Public.spending.on.health_New)

# We remove the 3 first rows

Public.spending.on.health_New <- Public.spending.on.health_New[-c(1:3),]
View(Public.spending.on.health_New)
Public.spending.on.health_New <- rename(Public.spending.on.health_New, c('Data.Source' = 'Country', 'World.Development.Indicators' = 'LOCALISATION'))
View(Public.spending.on.health_New)

# We remove the unecessary colomne, with no data corresponding

Public.spending.on.health_New <- Public.spending.on.health_New[,-c(5:44)]
View(Public.spending.on.health_New)

# We remove the unecessary columnes 

Public.spending.on.health_New$X.61 <- NULL
Public.spending.on.health_New$Country <- NULL
Public.spending.on.health_New$X <- NULL
Public.spending.on.health_New$X.1 <- NULL
Public.spending.on.health_New$X.62 <- NULL
Public.spending.on.health_New$X.63 <- NULL
View(Public.spending.on.health_New)

# We rename the columns variables by the years

Public.spending.on.health_New <- rename(Public.spending.on.health_New, c('2000'='X.42','2001'='X.43','2002'='X.44','2003'='X.45', '2004'='X.46','2005'='X.47','2006'='X.48','2007'='X.49', '2008'='X.50','2009'='X.51','2010'='X.52', '2011'='X.53','2012'='X.54','2013'='X.55','2014'='X.56','2015'='X.57','2016'='X.58','2017'='X.59','2018'='X.60'))


Public.spending.on.health_New <- Public.spending.on.health_New[-1,]

# First RUN, works before the upload of packages - If RUN everything (Tidyverse) CONFLICTS (dplyr), with rename...NOT working

library(tidyverse)
library(dplyr)

# Would like to re-arrange the position of the years next to the corresponding country, with 'pivot_longer'.

Public.spending.on.health_New <- Public.spending.on.health_New %>% pivot_longer(cols = c('2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017','2018'),names_to = 'TIME', values_to = 'value')

view(Public.spending.on.health_New)







