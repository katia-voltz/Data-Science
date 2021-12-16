
# load the required packages
packages <- c(
  "here","plyr","dplyr","tidyverse","tibble","corrplot","car","ggplot2",
  "FactoMineR","factoextra","openxlsx","knitr","kableExtra", "bookdown", "rmarkdown",
  "plotly","cowplot","lme4","maps","ggpubr","ggrepel","carData","sjPlot",'gridExtra')


purrr::walk(packages, library, character.only = TRUE)

options(digits = 5)

opts_chunk$set(collapse = TRUE,
               cache = FALSE,
               message = FALSE,
               echo = FALSE,
               warning=FALSE,
               fig.align = "center",
               fig.width = 8,
               fig.asp = 0.618,
               fig.show = "hold"
)

              
