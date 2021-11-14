
# load the required packages
packages <- c(
  "here","plyr","dplyr","tidyverse","tibble","corrplot","car","ggplot2","corrplot","FactoMineR","factoextra","openxlsx","knitr","kableExtra", "bookdown", "rmarkdown","leaflet","plotly","ggplot2")

purrr::walk(packages, library, character.only = TRUE)


