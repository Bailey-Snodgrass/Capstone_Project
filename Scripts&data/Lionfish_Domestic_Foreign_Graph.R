library(tidyverse)
library(exploreARTIS)


lionfish_data <- read.csv("C:/Users/Bailey New PC/Capstone/Lionfish_Consumption.csv")


lionfish_data_filtered <- lionfish_data %>%
  filter(source_country_iso3c == 'USA')

lionfish_graph <- plot_ts(lionfish_data_filtered, artis_var = "consumer_iso3c", value = "consumption_live_t", prop_flow_cutoff = .01, plot.type = "stacked")


lionfish_graph <- lionfish_graph +
  geom_vline(xintercept = 2015, linetype = "dotted", color = "red")
print(lionfish_graph)
