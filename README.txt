In order to knit our report, the following packages are neeeded: 

"here","plyr","dplyr","tidyverse","tibble","corrplot","car","ggplot2",
"FactoMineR","factoextra","openxlsx","knitr","kableExtra", "bookdown", "rmarkdown",
"plotly","cowplot","lme4","maps","ggpubr","ggrepel","carData","sjPlot","gridExtra"

When knitting the report, the program is designed to automatically select the necessary packages. However, if they have never been installed before, an error will appear.  

If this happens, the packages can be installed manually or by adding the following code to line 8 of the "setup.R" file: 

purrr::walk(packages, install.packages, repos = "http://cran.us.r-project.org", character.only = TRUE)

As adding this command slows down the knitting of the report, we recommend you to install the missing packages manually with the code: 

install.packages("PACKAGE TO INSTALL")
