#CSV which was made from the parquet

library(tidyverse)
library(exploreARTIS)


lionfish_data <- read.csv("C:/Users/Bailey New PC/Capstone/Lionfish_Trade.csv")


lionfish_data_filtered <- lionfish_data %>%
  filter(source_country_iso3c == 'USA')

lionfish_graph <- plot_ts(lionfish_data_filtered, artis_var = "importer_iso3c")


lionfish_graph <- lionfish_graph +
  geom_vline(xintercept = 2015, linetype = "dotted", color = "red")
print(lionfish_graph)