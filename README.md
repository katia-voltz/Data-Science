# Data-Science

# Regression 1 : Work Environment 

# Open/Read files
Incineg <- read.csv("Income inequality.csv")
attach(Incineg)
wages <- read.csv("Average wages.csv")
attach(wages)
YMH <- read.csv("share-with-mental-and-substance-disorders.csv")
attach(YMH)
unemp <- read.csv("Unemployement Rate.csv")
attach(unemp)
jobqual <- read.csv("Job Quality.csv")
attach(jobqual)
worktime <- read.csv("Avg work time per country.csv")
attach(worktime)

# Data sorting 
data_1 <- wages[,-c(2:5,8)]
view(data_1)

# Tables merge 

