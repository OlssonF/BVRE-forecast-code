source('R/edi_qaqc_combine.R')
#library(tidyverse)
#library(lubridate)
#library(yaml)
#library(EDIutils)

# open config file
config_file <- read_yaml('~/BVRE-forecast-code/configuration/default/observation_processing.yml')

## read offset file 
entity_names <- read_data_entity_names(packageId = 'edi.725.3')
offset <- read_data_entity(packageId = 'edi.725.3', entityId = entity_names$entityId[6])
offset <- readr::read_csv(file = offset)

L1_file <- read.csv('https://raw.githubusercontent.com/addelany/BVRE-data/bvre-platform-data/bvre-waterquality_L1.csv', 
                    na.strings = 'NA', stringsAsFactors = FALSE)




test_df <- wq_realtime_edi_combine(realtime_file = 'https://raw.githubusercontent.com/addelany/BVRE-data/bvre-platform-data/bvre-waterquality_L1.csv', 
                            qaqc_file = 'https://portal.edirepository.org/nis/dataviewer?packageid=edi.725.3&entityid=a9a7ff6fe8dc20f7a8f89447d4dc2038', 
                            offset_file = 'https://portal.edirepository.org/nis/dataviewer?packageid=edi.725.3&entityid=5927a50118644fa451badb3b84233bb7', 
                            config_file = 'https://raw.githubusercontent.com/FLARE-forecast/BVRE-forecast-code/master/configuration/default/observation_processing.yml')
