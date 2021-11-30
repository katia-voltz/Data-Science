
# load the required packages
packages <- c(
  "here","plyr","dplyr","tidyverse","tibble","corrplot","car","ggplot2","FactoMineR","factoextra","openxlsx","knitr","kableExtra", "bookdown", "rmarkdown","leaflet","plotly","cowplot")

purrr::walk(packages, library, character.only = TRUE)


