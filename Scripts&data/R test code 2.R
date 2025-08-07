library(tidyverse)
library(exploreARTIS)

csv <- read.csv("~/bailey_stuff/snodgras/artis_request_snodgrass.csv")

catfish_csv <- csv %>%
  filter("ictalurus punctatus" == sciname)

catfish_csv <- catfish_csv %>%
  filter("capture" == method)

catfish_csv$nativity <- ifelse(
  catfish_csv$source_country_iso3c %in% c("USA", "CAN", "MEX"),
  "native",
  "invasive"
)

plt <- plot_bar(catfish_csv,
                bar_group = "exporter_iso3c",
                facet_variable = "nativity",
                facet_values = c("native", "invasive")
)


print(plt)