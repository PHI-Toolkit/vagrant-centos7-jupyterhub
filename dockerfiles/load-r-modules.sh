#!/bin/bash
R -e "install.packages(c('dplyr', 'tidyr', 'stringr', 'lubridate'), repos='http://mran.microsoft.com/')"
R -e "install.packages(c('jsonlite', 'XML', 'quantmod', 'rvest', 'reshape2'), repos='http://mran.microsoft.com/')"
R -e "install.packages(c('ggplot2', 'ggvis', 'rgl', 'htmlwidgets'), repos='http://mran.microsoft.com/')"
R -e "install.packages(c('knitr', 'plotly', 'RColorBrewer'), repos='http://mran.microsoft.com/')"
R -e "install.packages(c('randomForest', 'e1071', 'rpart'), repos='http://mran.microsoft.com/')"
R -e "install.packages(c('text2vec', 'tm', 'topicmodels', 'quanteda'), repos='http://mran.microsoft.com/')"
