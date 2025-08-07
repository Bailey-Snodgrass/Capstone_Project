# TITLE: snodgrass_request.R
# DESCRIPTION: Data filter for Baily Snodgrass capstone project

# load packages
library(tidyverse)
library(exploreARTIS)

# set scinames
# tilapia
tilapia_scinames <- sciname_metadata %>%
  filter(genus == "oreochromis") %>%
  pull(sciname)

# carp
carp_scinames <- sciname_metadata %>%
  filter(genus %in% c("ctenopharyngodon", "cyprinus", "hypophthalmichthys")) %>%
  pull(sciname)

sciname_list <- c("ictalurus punctatus", # channel catfish
                  "pterois volitans", # lionfish
                  "carcinus maenas", # green crab
                  "oncorhynchus keta", # chum salmon
                  "oncorhynchus tshawytscha", # chinook salmon
                  "salmo trutta", # brown trout
                  "ruditapes philippinarum", # manila clam
                  "mytilus edulis", # blue mussel
                  tilapia_scinames, carp_scinames)

# filter data
artis_request <- artis_custom %>%
  filter(sciname %in% sciname_list) 

# write out csv file
write.csv(artis_request, "data_requests/artis_request_snodgrass.csv", 
          row.names = FALSE)