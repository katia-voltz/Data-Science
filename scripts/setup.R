
# load the required packages
packages <- c(
  "here","plyr","dplyr","tidyverse","tibble","corrplot","car","ggplot2","FactoMineR","factoextra","openxlsx","knitr","kableExtra", "bookdown", "rmarkdown","leaflet","plotly","cowplot","lme4","car","maps","ggpubr","ggrepel")

purrr::walk(packages, library, character.only = TRUE)

options(digits = 5)

opts_chunk$set(collapse = TRUE,
               cache = FALSE,
               message = FALSE,
               echo = FALSE,
               warning=FALSE
)

              
