# Package ID: edi.725.3 Cataloging System:https://pasta.edirepository.org.
# Data set title: Time series of high-frequency sensor data measuring water temperature, dissolved oxygen, conductivity, specific conductance, total dissolved solids, chlorophyll a, phycocyanin, fluorescent dissolved organic matter, and turbidity at discrete depths in Beaverdam Reservoir, Virginia, USA in 2016-2022.
# Data set creator:  Cayelan Carey - Virginia Tech 
# Data set creator:  Adrienne Breef-Pilz - Virginia Tech 
# Data set creator:  Bethany Bookout - Virginia Tech 
# Data set creator:  Ryan McClure - Virginia Tech 
# Data set creator:  Jacob Wynne - Virginia Tech 
# Contact:  Cayelan Carey -  Virginia Tech  - Cayelan@vt.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

source('R/edi_qaqc_combine.R')
library(tidyverse)
library(lubridate)
library(yaml)
library(EDIutils)

# open config file
config_file <- read_yaml('~/BVRE-forecast-code/configuration/default/observation_processing.yml')

## read offset file 
entity_names <- read_data_entity_names(packageId = 'edi.725.3')
offset <- read_data_entity(packageId = 'edi.725.3', entityId = entity_names$entityId[6])
offset <- readr::read_csv(file = offset)

L1_file <- read.csv('https://raw.githubusercontent.com/addelany/BVRE-data/bvre-platform-data/bvre-waterquality_L1.csv', 
                    na.strings = 'NA', stringsAsFactors = FALSE)

test_df <- qaqc_edi_combine(realtime_file = L1_file, qaqc_file = edi_file, offset_file = offset, config = config_file)
