#packages

library(tidyverse)
library(exploreARTIS)

#name object/object type/file path

csv <- read.csv("C:\\Users\\Bailey New PC\\Downloads\\artis_request_snodgrass.csv")

home_country_consumption <- csv %>%
  filter(source_country_iso3c == importer_iso3c)

#write.csv(home_country_consumption, "C:\\Users\\Bailey New PC\\Capstone\\home country test.csv", row.names = FALSE)

#write.csv(home_country_consumption, "C:\\Users\\Bailey New PC\\Capstone\\home country test.csv", row.names = FALSE)

catfish_csv <- csv %>%
  filter("ictalurus punctatus" == sciname)

catfish_csv <- csv %>%
  filter ("capture" == method)

#catfish_csv$nativity <- ifelse(
  #catfish_csv$source_country_iso3c %in% c("USA","CAN","MEX"),
                              # 'native',
                              # 'invasive')

catfish_csv <- csv %>% 
  filter(sciname == "ictalurus punctatus", method == "capture") %>%
  mutate(native_status = case_when(
    source_country_iso3c %in% c("USA", "MEX", "CAN") ~ "native",
TRUE ~ "non-native"))


write.csv(catfish_csv, "C:\\Users\\Bailey New PC\\Capstone\\catfish_categories.csv", row.names = FALSE)

catfish_native <- 

catfish_invasive <-


home_country_consumption_catfish <- home_country_consumption %>%
  filter("ictalurus punctatus" == sciname)

test <- plot_ts(home_country_consumption_catfish,
                artis_var = "importer_iso3c",
                plot.type = "stacked")

print(test)