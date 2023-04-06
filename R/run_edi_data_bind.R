# Package ID: edi.725.3 Cataloging System:https://pasta.edirepository.org.
# Data set title: Time series of high-frequency sensor data measuring water temperature, dissolved oxygen, conductivity, specific conductance, total dissolved solids, chlorophyll a, phycocyanin, fluorescent dissolved organic matter, and turbidity at discrete depths in Beaverdam Reservoir, Virginia, USA in 2016-2022.
# Data set creator:  Cayelan Carey - Virginia Tech 
# Data set creator:  Adrienne Breef-Pilz - Virginia Tech 
# Data set creator:  Bethany Bookout - Virginia Tech 
# Data set creator:  Ryan McClure - Virginia Tech 
# Data set creator:  Jacob Wynne - Virginia Tech 
# Contact:  Cayelan Carey -  Virginia Tech  - Cayelan@vt.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/725/3/a9a7ff6fe8dc20f7a8f89447d4dc2038" 
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               , col.names=c(
                 "Reservoir",     
                 "Site",     
                 "DateTime",     
                 "ThermistorTemp_C_1",     
                 "ThermistorTemp_C_2",     
                 "ThermistorTemp_C_3",     
                 "ThermistorTemp_C_4",     
                 "ThermistorTemp_C_5",     
                 "ThermistorTemp_C_6",     
                 "ThermistorTemp_C_7",     
                 "ThermistorTemp_C_8",     
                 "ThermistorTemp_C_9",     
                 "ThermistorTemp_C_10",     
                 "ThermistorTemp_C_11",     
                 "ThermistorTemp_C_12",     
                 "ThermistorTemp_C_13",     
                 "RDO_mgL_6",     
                 "RDOsat_percent_6",     
                 "RDOTemp_C_6",     
                 "RDO_mgL_13",     
                 "RDOsat_percent_13",     
                 "RDOTemp_C_13",     
                 "EXOTemp_C_1.5",     
                 "EXOCond_uScm_1.5",     
                 "EXOSpCond_uScm_1.5",     
                 "EXOTDS_mgL_1.5",     
                 "EXODOsat_percent_1.5",     
                 "EXODO_mgL_1.5",     
                 "EXOChla_RFU_1.5",     
                 "EXOChla_ugL_1.5",     
                 "EXOBGAPC_RFU_1.5",     
                 "EXOBGAPC_ugL_1.5",     
                 "EXOfDOM_RFU_1.5",     
                 "EXOfDOM_QSU_1.5",     
                 "EXOTurbidity_FNU_1.5",     
                 "EXOPressure_psi",     
                 "EXODepth_m",     
                 "EXOBattery_V",     
                 "EXOCablepower_V",     
                 "EXOWiper_V",     
                 "LvlPressure_psi_13",     
                 "Depth_m_13",     
                 "LvlTemp_C_13",     
                 "RECORD",     
                 "CR6Battery_V",     
                 "CR6Panel_Temp_C",     
                 "Flag_ThermistorTemp_C_1",     
                 "Flag_ThermistorTemp_C_2",     
                 "Flag_ThermistorTemp_C_3",     
                 "Flag_ThermistorTemp_C_4",     
                 "Flag_ThermistorTemp_C_5",     
                 "Flag_ThermistorTemp_C_6",     
                 "Flag_ThermistorTemp_C_7",     
                 "Flag_ThermistorTemp_C_8",     
                 "Flag_ThermistorTemp_C_9",     
                 "Flag_ThermistorTemp_C_10",     
                 "Flag_ThermistorTemp_C_11",     
                 "Flag_ThermistorTemp_C_12",     
                 "Flag_ThermistorTemp_C_13",     
                 "Flag_RDO_mgL_6",     
                 "Flag_RDOsat_percent_6",     
                 "Flag_RDOTemp_C_6",     
                 "Flag_RDO_mgL_13",     
                 "Flag_RDOsat_percent_13",     
                 "Flag_RDOTemp_C_13",     
                 "Flag_EXOTemp_C_1.5",     
                 "Flag_EXOCond_uScm_1.5",     
                 "Flag_EXOSpCond_uScm_1.5",     
                 "Flag_EXOTDS_mgL_1.5",     
                 "Flag_EXODOsat_percent_1.5",     
                 "Flag_EXODO_mgL_1.5",     
                 "Flag_EXOChla_RFU_1.5",     
                 "Flag_EXOChla_ugL_1.5",     
                 "Flag_EXOBGAPC_RFU_1.5",     
                 "Flag_EXOBGAPC_ugL_1.5",     
                 "Flag_EXOfDOM_RFU_1.5",     
                 "Flag_EXOfDOM_QSU_1.5",     
                 "Flag_EXOTurbidity_FNU_1.5",     
                 "Flag_EXOPressure_psi",     
                 "Flag_EXODepth_m",     
                 "Flag_EXOBattery_V",     
                 "Flag_EXOCablepower_V",     
                 "Flag_EXOWiper_V",     
                 "Flag_LvlPressure_psi_13",     
                 "Flag_LvlTemp_C_13"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$Reservoir)!="factor") dt1$Reservoir<- as.factor(dt1$Reservoir)
if (class(dt1$Site)!="factor") dt1$Site<- as.factor(dt1$Site)                                   
# attempting to convert dt1$DateTime dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d %H:%M:%S" 
tmp1DateTime<-as.POSIXct(dt1$DateTime,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp1DateTime) == length(tmp1DateTime[!is.na(tmp1DateTime)])){dt1$DateTime <- tmp1DateTime } else {print("Date conversion failed for dt1$DateTime. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp1DateTime) 
if (class(dt1$ThermistorTemp_C_1)=="factor") dt1$ThermistorTemp_C_1 <-as.numeric(levels(dt1$ThermistorTemp_C_1))[as.integer(dt1$ThermistorTemp_C_1) ]               
if (class(dt1$ThermistorTemp_C_1)=="character") dt1$ThermistorTemp_C_1 <-as.numeric(dt1$ThermistorTemp_C_1)
if (class(dt1$ThermistorTemp_C_2)=="factor") dt1$ThermistorTemp_C_2 <-as.numeric(levels(dt1$ThermistorTemp_C_2))[as.integer(dt1$ThermistorTemp_C_2) ]               
if (class(dt1$ThermistorTemp_C_2)=="character") dt1$ThermistorTemp_C_2 <-as.numeric(dt1$ThermistorTemp_C_2)
if (class(dt1$ThermistorTemp_C_3)=="factor") dt1$ThermistorTemp_C_3 <-as.numeric(levels(dt1$ThermistorTemp_C_3))[as.integer(dt1$ThermistorTemp_C_3) ]               
if (class(dt1$ThermistorTemp_C_3)=="character") dt1$ThermistorTemp_C_3 <-as.numeric(dt1$ThermistorTemp_C_3)
if (class(dt1$ThermistorTemp_C_4)=="factor") dt1$ThermistorTemp_C_4 <-as.numeric(levels(dt1$ThermistorTemp_C_4))[as.integer(dt1$ThermistorTemp_C_4) ]               
if (class(dt1$ThermistorTemp_C_4)=="character") dt1$ThermistorTemp_C_4 <-as.numeric(dt1$ThermistorTemp_C_4)
if (class(dt1$ThermistorTemp_C_5)=="factor") dt1$ThermistorTemp_C_5 <-as.numeric(levels(dt1$ThermistorTemp_C_5))[as.integer(dt1$ThermistorTemp_C_5) ]               
if (class(dt1$ThermistorTemp_C_5)=="character") dt1$ThermistorTemp_C_5 <-as.numeric(dt1$ThermistorTemp_C_5)
if (class(dt1$ThermistorTemp_C_6)=="factor") dt1$ThermistorTemp_C_6 <-as.numeric(levels(dt1$ThermistorTemp_C_6))[as.integer(dt1$ThermistorTemp_C_6) ]               
if (class(dt1$ThermistorTemp_C_6)=="character") dt1$ThermistorTemp_C_6 <-as.numeric(dt1$ThermistorTemp_C_6)
if (class(dt1$ThermistorTemp_C_7)=="factor") dt1$ThermistorTemp_C_7 <-as.numeric(levels(dt1$ThermistorTemp_C_7))[as.integer(dt1$ThermistorTemp_C_7) ]               
if (class(dt1$ThermistorTemp_C_7)=="character") dt1$ThermistorTemp_C_7 <-as.numeric(dt1$ThermistorTemp_C_7)
if (class(dt1$ThermistorTemp_C_8)=="factor") dt1$ThermistorTemp_C_8 <-as.numeric(levels(dt1$ThermistorTemp_C_8))[as.integer(dt1$ThermistorTemp_C_8) ]               
if (class(dt1$ThermistorTemp_C_8)=="character") dt1$ThermistorTemp_C_8 <-as.numeric(dt1$ThermistorTemp_C_8)
if (class(dt1$ThermistorTemp_C_9)=="factor") dt1$ThermistorTemp_C_9 <-as.numeric(levels(dt1$ThermistorTemp_C_9))[as.integer(dt1$ThermistorTemp_C_9) ]               
if (class(dt1$ThermistorTemp_C_9)=="character") dt1$ThermistorTemp_C_9 <-as.numeric(dt1$ThermistorTemp_C_9)
if (class(dt1$ThermistorTemp_C_10)=="factor") dt1$ThermistorTemp_C_10 <-as.numeric(levels(dt1$ThermistorTemp_C_10))[as.integer(dt1$ThermistorTemp_C_10) ]               
if (class(dt1$ThermistorTemp_C_10)=="character") dt1$ThermistorTemp_C_10 <-as.numeric(dt1$ThermistorTemp_C_10)
if (class(dt1$ThermistorTemp_C_11)=="factor") dt1$ThermistorTemp_C_11 <-as.numeric(levels(dt1$ThermistorTemp_C_11))[as.integer(dt1$ThermistorTemp_C_11) ]               
if (class(dt1$ThermistorTemp_C_11)=="character") dt1$ThermistorTemp_C_11 <-as.numeric(dt1$ThermistorTemp_C_11)
if (class(dt1$ThermistorTemp_C_12)=="factor") dt1$ThermistorTemp_C_12 <-as.numeric(levels(dt1$ThermistorTemp_C_12))[as.integer(dt1$ThermistorTemp_C_12) ]               
if (class(dt1$ThermistorTemp_C_12)=="character") dt1$ThermistorTemp_C_12 <-as.numeric(dt1$ThermistorTemp_C_12)
if (class(dt1$ThermistorTemp_C_13)=="factor") dt1$ThermistorTemp_C_13 <-as.numeric(levels(dt1$ThermistorTemp_C_13))[as.integer(dt1$ThermistorTemp_C_13) ]               
if (class(dt1$ThermistorTemp_C_13)=="character") dt1$ThermistorTemp_C_13 <-as.numeric(dt1$ThermistorTemp_C_13)
if (class(dt1$RDO_mgL_6)=="factor") dt1$RDO_mgL_6 <-as.numeric(levels(dt1$RDO_mgL_6))[as.integer(dt1$RDO_mgL_6) ]               
if (class(dt1$RDO_mgL_6)=="character") dt1$RDO_mgL_6 <-as.numeric(dt1$RDO_mgL_6)
if (class(dt1$RDOsat_percent_6)=="factor") dt1$RDOsat_percent_6 <-as.numeric(levels(dt1$RDOsat_percent_6))[as.integer(dt1$RDOsat_percent_6) ]               
if (class(dt1$RDOsat_percent_6)=="character") dt1$RDOsat_percent_6 <-as.numeric(dt1$RDOsat_percent_6)
if (class(dt1$RDOTemp_C_6)=="factor") dt1$RDOTemp_C_6 <-as.numeric(levels(dt1$RDOTemp_C_6))[as.integer(dt1$RDOTemp_C_6) ]               
if (class(dt1$RDOTemp_C_6)=="character") dt1$RDOTemp_C_6 <-as.numeric(dt1$RDOTemp_C_6)
if (class(dt1$RDO_mgL_13)=="factor") dt1$RDO_mgL_13 <-as.numeric(levels(dt1$RDO_mgL_13))[as.integer(dt1$RDO_mgL_13) ]               
if (class(dt1$RDO_mgL_13)=="character") dt1$RDO_mgL_13 <-as.numeric(dt1$RDO_mgL_13)
if (class(dt1$RDOsat_percent_13)=="factor") dt1$RDOsat_percent_13 <-as.numeric(levels(dt1$RDOsat_percent_13))[as.integer(dt1$RDOsat_percent_13) ]               
if (class(dt1$RDOsat_percent_13)=="character") dt1$RDOsat_percent_13 <-as.numeric(dt1$RDOsat_percent_13)
if (class(dt1$RDOTemp_C_13)=="factor") dt1$RDOTemp_C_13 <-as.numeric(levels(dt1$RDOTemp_C_13))[as.integer(dt1$RDOTemp_C_13) ]               
if (class(dt1$RDOTemp_C_13)=="character") dt1$RDOTemp_C_13 <-as.numeric(dt1$RDOTemp_C_13)
if (class(dt1$EXOTemp_C_1.5)=="factor") dt1$EXOTemp_C_1.5 <-as.numeric(levels(dt1$EXOTemp_C_1.5))[as.integer(dt1$EXOTemp_C_1.5) ]               
if (class(dt1$EXOTemp_C_1.5)=="character") dt1$EXOTemp_C_1.5 <-as.numeric(dt1$EXOTemp_C_1.5)
if (class(dt1$EXOCond_uScm_1.5)=="factor") dt1$EXOCond_uScm_1.5 <-as.numeric(levels(dt1$EXOCond_uScm_1.5))[as.integer(dt1$EXOCond_uScm_1.5) ]               
if (class(dt1$EXOCond_uScm_1.5)=="character") dt1$EXOCond_uScm_1.5 <-as.numeric(dt1$EXOCond_uScm_1.5)
if (class(dt1$EXOSpCond_uScm_1.5)=="factor") dt1$EXOSpCond_uScm_1.5 <-as.numeric(levels(dt1$EXOSpCond_uScm_1.5))[as.integer(dt1$EXOSpCond_uScm_1.5) ]               
if (class(dt1$EXOSpCond_uScm_1.5)=="character") dt1$EXOSpCond_uScm_1.5 <-as.numeric(dt1$EXOSpCond_uScm_1.5)
if (class(dt1$EXOTDS_mgL_1.5)=="factor") dt1$EXOTDS_mgL_1.5 <-as.numeric(levels(dt1$EXOTDS_mgL_1.5))[as.integer(dt1$EXOTDS_mgL_1.5) ]               
if (class(dt1$EXOTDS_mgL_1.5)=="character") dt1$EXOTDS_mgL_1.5 <-as.numeric(dt1$EXOTDS_mgL_1.5)
if (class(dt1$EXODOsat_percent_1.5)=="factor") dt1$EXODOsat_percent_1.5 <-as.numeric(levels(dt1$EXODOsat_percent_1.5))[as.integer(dt1$EXODOsat_percent_1.5) ]               
if (class(dt1$EXODOsat_percent_1.5)=="character") dt1$EXODOsat_percent_1.5 <-as.numeric(dt1$EXODOsat_percent_1.5)
if (class(dt1$EXODO_mgL_1.5)=="factor") dt1$EXODO_mgL_1.5 <-as.numeric(levels(dt1$EXODO_mgL_1.5))[as.integer(dt1$EXODO_mgL_1.5) ]               
if (class(dt1$EXODO_mgL_1.5)=="character") dt1$EXODO_mgL_1.5 <-as.numeric(dt1$EXODO_mgL_1.5)
if (class(dt1$EXOChla_RFU_1.5)=="factor") dt1$EXOChla_RFU_1.5 <-as.numeric(levels(dt1$EXOChla_RFU_1.5))[as.integer(dt1$EXOChla_RFU_1.5) ]               
if (class(dt1$EXOChla_RFU_1.5)=="character") dt1$EXOChla_RFU_1.5 <-as.numeric(dt1$EXOChla_RFU_1.5)
if (class(dt1$EXOChla_ugL_1.5)=="factor") dt1$EXOChla_ugL_1.5 <-as.numeric(levels(dt1$EXOChla_ugL_1.5))[as.integer(dt1$EXOChla_ugL_1.5) ]               
if (class(dt1$EXOChla_ugL_1.5)=="character") dt1$EXOChla_ugL_1.5 <-as.numeric(dt1$EXOChla_ugL_1.5)
if (class(dt1$EXOBGAPC_RFU_1.5)=="factor") dt1$EXOBGAPC_RFU_1.5 <-as.numeric(levels(dt1$EXOBGAPC_RFU_1.5))[as.integer(dt1$EXOBGAPC_RFU_1.5) ]               
if (class(dt1$EXOBGAPC_RFU_1.5)=="character") dt1$EXOBGAPC_RFU_1.5 <-as.numeric(dt1$EXOBGAPC_RFU_1.5)
if (class(dt1$EXOBGAPC_ugL_1.5)=="factor") dt1$EXOBGAPC_ugL_1.5 <-as.numeric(levels(dt1$EXOBGAPC_ugL_1.5))[as.integer(dt1$EXOBGAPC_ugL_1.5) ]               
if (class(dt1$EXOBGAPC_ugL_1.5)=="character") dt1$EXOBGAPC_ugL_1.5 <-as.numeric(dt1$EXOBGAPC_ugL_1.5)
if (class(dt1$EXOfDOM_RFU_1.5)=="factor") dt1$EXOfDOM_RFU_1.5 <-as.numeric(levels(dt1$EXOfDOM_RFU_1.5))[as.integer(dt1$EXOfDOM_RFU_1.5) ]               
if (class(dt1$EXOfDOM_RFU_1.5)=="character") dt1$EXOfDOM_RFU_1.5 <-as.numeric(dt1$EXOfDOM_RFU_1.5)
if (class(dt1$EXOfDOM_QSU_1.5)=="factor") dt1$EXOfDOM_QSU_1.5 <-as.numeric(levels(dt1$EXOfDOM_QSU_1.5))[as.integer(dt1$EXOfDOM_QSU_1.5) ]               
if (class(dt1$EXOfDOM_QSU_1.5)=="character") dt1$EXOfDOM_QSU_1.5 <-as.numeric(dt1$EXOfDOM_QSU_1.5)
if (class(dt1$EXOTurbidity_FNU_1.5)=="factor") dt1$EXOTurbidity_FNU_1.5 <-as.numeric(levels(dt1$EXOTurbidity_FNU_1.5))[as.integer(dt1$EXOTurbidity_FNU_1.5) ]               
if (class(dt1$EXOTurbidity_FNU_1.5)=="character") dt1$EXOTurbidity_FNU_1.5 <-as.numeric(dt1$EXOTurbidity_FNU_1.5)
if (class(dt1$EXOPressure_psi)=="factor") dt1$EXOPressure_psi <-as.numeric(levels(dt1$EXOPressure_psi))[as.integer(dt1$EXOPressure_psi) ]               
if (class(dt1$EXOPressure_psi)=="character") dt1$EXOPressure_psi <-as.numeric(dt1$EXOPressure_psi)
if (class(dt1$EXODepth_m)=="factor") dt1$EXODepth_m <-as.numeric(levels(dt1$EXODepth_m))[as.integer(dt1$EXODepth_m) ]               
if (class(dt1$EXODepth_m)=="character") dt1$EXODepth_m <-as.numeric(dt1$EXODepth_m)
if (class(dt1$EXOBattery_V)=="factor") dt1$EXOBattery_V <-as.numeric(levels(dt1$EXOBattery_V))[as.integer(dt1$EXOBattery_V) ]               
if (class(dt1$EXOBattery_V)=="character") dt1$EXOBattery_V <-as.numeric(dt1$EXOBattery_V)
if (class(dt1$EXOCablepower_V)=="factor") dt1$EXOCablepower_V <-as.numeric(levels(dt1$EXOCablepower_V))[as.integer(dt1$EXOCablepower_V) ]               
if (class(dt1$EXOCablepower_V)=="character") dt1$EXOCablepower_V <-as.numeric(dt1$EXOCablepower_V)
if (class(dt1$EXOWiper_V)=="factor") dt1$EXOWiper_V <-as.numeric(levels(dt1$EXOWiper_V))[as.integer(dt1$EXOWiper_V) ]               
if (class(dt1$EXOWiper_V)=="character") dt1$EXOWiper_V <-as.numeric(dt1$EXOWiper_V)
if (class(dt1$LvlPressure_psi_13)=="factor") dt1$LvlPressure_psi_13 <-as.numeric(levels(dt1$LvlPressure_psi_13))[as.integer(dt1$LvlPressure_psi_13) ]               
if (class(dt1$LvlPressure_psi_13)=="character") dt1$LvlPressure_psi_13 <-as.numeric(dt1$LvlPressure_psi_13)
if (class(dt1$Depth_m_13)=="factor") dt1$Depth_m_13 <-as.numeric(levels(dt1$Depth_m_13))[as.integer(dt1$Depth_m_13) ]               
if (class(dt1$Depth_m_13)=="character") dt1$Depth_m_13 <-as.numeric(dt1$Depth_m_13)
if (class(dt1$LvlTemp_C_13)=="factor") dt1$LvlTemp_C_13 <-as.numeric(levels(dt1$LvlTemp_C_13))[as.integer(dt1$LvlTemp_C_13) ]               
if (class(dt1$LvlTemp_C_13)=="character") dt1$LvlTemp_C_13 <-as.numeric(dt1$LvlTemp_C_13)
if (class(dt1$RECORD)=="factor") dt1$RECORD <-as.numeric(levels(dt1$RECORD))[as.integer(dt1$RECORD) ]               
if (class(dt1$RECORD)=="character") dt1$RECORD <-as.numeric(dt1$RECORD)
if (class(dt1$CR6Battery_V)=="factor") dt1$CR6Battery_V <-as.numeric(levels(dt1$CR6Battery_V))[as.integer(dt1$CR6Battery_V) ]               
if (class(dt1$CR6Battery_V)=="character") dt1$CR6Battery_V <-as.numeric(dt1$CR6Battery_V)
if (class(dt1$CR6Panel_Temp_C)=="factor") dt1$CR6Panel_Temp_C <-as.numeric(levels(dt1$CR6Panel_Temp_C))[as.integer(dt1$CR6Panel_Temp_C) ]               
if (class(dt1$CR6Panel_Temp_C)=="character") dt1$CR6Panel_Temp_C <-as.numeric(dt1$CR6Panel_Temp_C)
if (class(dt1$Flag_ThermistorTemp_C_1)!="factor") dt1$Flag_ThermistorTemp_C_1<- as.factor(dt1$Flag_ThermistorTemp_C_1)
if (class(dt1$Flag_ThermistorTemp_C_2)!="factor") dt1$Flag_ThermistorTemp_C_2<- as.factor(dt1$Flag_ThermistorTemp_C_2)
if (class(dt1$Flag_ThermistorTemp_C_3)!="factor") dt1$Flag_ThermistorTemp_C_3<- as.factor(dt1$Flag_ThermistorTemp_C_3)
if (class(dt1$Flag_ThermistorTemp_C_4)!="factor") dt1$Flag_ThermistorTemp_C_4<- as.factor(dt1$Flag_ThermistorTemp_C_4)
if (class(dt1$Flag_ThermistorTemp_C_5)!="factor") dt1$Flag_ThermistorTemp_C_5<- as.factor(dt1$Flag_ThermistorTemp_C_5)
if (class(dt1$Flag_ThermistorTemp_C_6)!="factor") dt1$Flag_ThermistorTemp_C_6<- as.factor(dt1$Flag_ThermistorTemp_C_6)
if (class(dt1$Flag_ThermistorTemp_C_7)!="factor") dt1$Flag_ThermistorTemp_C_7<- as.factor(dt1$Flag_ThermistorTemp_C_7)
if (class(dt1$Flag_ThermistorTemp_C_8)!="factor") dt1$Flag_ThermistorTemp_C_8<- as.factor(dt1$Flag_ThermistorTemp_C_8)
if (class(dt1$Flag_ThermistorTemp_C_9)!="factor") dt1$Flag_ThermistorTemp_C_9<- as.factor(dt1$Flag_ThermistorTemp_C_9)
if (class(dt1$Flag_ThermistorTemp_C_10)!="factor") dt1$Flag_ThermistorTemp_C_10<- as.factor(dt1$Flag_ThermistorTemp_C_10)
if (class(dt1$Flag_ThermistorTemp_C_11)!="factor") dt1$Flag_ThermistorTemp_C_11<- as.factor(dt1$Flag_ThermistorTemp_C_11)
if (class(dt1$Flag_ThermistorTemp_C_12)!="factor") dt1$Flag_ThermistorTemp_C_12<- as.factor(dt1$Flag_ThermistorTemp_C_12)
if (class(dt1$Flag_ThermistorTemp_C_13)!="factor") dt1$Flag_ThermistorTemp_C_13<- as.factor(dt1$Flag_ThermistorTemp_C_13)
if (class(dt1$Flag_RDO_mgL_6)!="factor") dt1$Flag_RDO_mgL_6<- as.factor(dt1$Flag_RDO_mgL_6)
if (class(dt1$Flag_RDOsat_percent_6)!="factor") dt1$Flag_RDOsat_percent_6<- as.factor(dt1$Flag_RDOsat_percent_6)
if (class(dt1$Flag_RDOTemp_C_6)!="factor") dt1$Flag_RDOTemp_C_6<- as.factor(dt1$Flag_RDOTemp_C_6)
if (class(dt1$Flag_RDO_mgL_13)!="factor") dt1$Flag_RDO_mgL_13<- as.factor(dt1$Flag_RDO_mgL_13)
if (class(dt1$Flag_RDOsat_percent_13)!="factor") dt1$Flag_RDOsat_percent_13<- as.factor(dt1$Flag_RDOsat_percent_13)
if (class(dt1$Flag_RDOTemp_C_13)!="factor") dt1$Flag_RDOTemp_C_13<- as.factor(dt1$Flag_RDOTemp_C_13)
if (class(dt1$Flag_EXOTemp_C_1.5)!="factor") dt1$Flag_EXOTemp_C_1.5<- as.factor(dt1$Flag_EXOTemp_C_1.5)
if (class(dt1$Flag_EXOCond_uScm_1.5)!="factor") dt1$Flag_EXOCond_uScm_1.5<- as.factor(dt1$Flag_EXOCond_uScm_1.5)
if (class(dt1$Flag_EXOSpCond_uScm_1.5)!="factor") dt1$Flag_EXOSpCond_uScm_1.5<- as.factor(dt1$Flag_EXOSpCond_uScm_1.5)
if (class(dt1$Flag_EXOTDS_mgL_1.5)!="factor") dt1$Flag_EXOTDS_mgL_1.5<- as.factor(dt1$Flag_EXOTDS_mgL_1.5)
if (class(dt1$Flag_EXODOsat_percent_1.5)!="factor") dt1$Flag_EXODOsat_percent_1.5<- as.factor(dt1$Flag_EXODOsat_percent_1.5)
if (class(dt1$Flag_EXODO_mgL_1.5)!="factor") dt1$Flag_EXODO_mgL_1.5<- as.factor(dt1$Flag_EXODO_mgL_1.5)
if (class(dt1$Flag_EXOChla_RFU_1.5)!="factor") dt1$Flag_EXOChla_RFU_1.5<- as.factor(dt1$Flag_EXOChla_RFU_1.5)
if (class(dt1$Flag_EXOChla_ugL_1.5)!="factor") dt1$Flag_EXOChla_ugL_1.5<- as.factor(dt1$Flag_EXOChla_ugL_1.5)
if (class(dt1$Flag_EXOBGAPC_RFU_1.5)!="factor") dt1$Flag_EXOBGAPC_RFU_1.5<- as.factor(dt1$Flag_EXOBGAPC_RFU_1.5)
if (class(dt1$Flag_EXOBGAPC_ugL_1.5)!="factor") dt1$Flag_EXOBGAPC_ugL_1.5<- as.factor(dt1$Flag_EXOBGAPC_ugL_1.5)
if (class(dt1$Flag_EXOfDOM_RFU_1.5)!="factor") dt1$Flag_EXOfDOM_RFU_1.5<- as.factor(dt1$Flag_EXOfDOM_RFU_1.5)
if (class(dt1$Flag_EXOfDOM_QSU_1.5)!="factor") dt1$Flag_EXOfDOM_QSU_1.5<- as.factor(dt1$Flag_EXOfDOM_QSU_1.5)
if (class(dt1$Flag_EXOTurbidity_FNU_1.5)!="factor") dt1$Flag_EXOTurbidity_FNU_1.5<- as.factor(dt1$Flag_EXOTurbidity_FNU_1.5)
if (class(dt1$Flag_EXOPressure_psi)!="factor") dt1$Flag_EXOPressure_psi<- as.factor(dt1$Flag_EXOPressure_psi)
if (class(dt1$Flag_EXODepth_m)!="factor") dt1$Flag_EXODepth_m<- as.factor(dt1$Flag_EXODepth_m)
if (class(dt1$Flag_EXOBattery_V)!="factor") dt1$Flag_EXOBattery_V<- as.factor(dt1$Flag_EXOBattery_V)
if (class(dt1$Flag_EXOCablepower_V)!="factor") dt1$Flag_EXOCablepower_V<- as.factor(dt1$Flag_EXOCablepower_V)
if (class(dt1$Flag_EXOWiper_V)!="factor") dt1$Flag_EXOWiper_V<- as.factor(dt1$Flag_EXOWiper_V)
if (class(dt1$Flag_LvlPressure_psi_13)!="factor") dt1$Flag_LvlPressure_psi_13<- as.factor(dt1$Flag_LvlPressure_psi_13)
if (class(dt1$Flag_LvlTemp_C_13)!="factor") dt1$Flag_LvlTemp_C_13<- as.factor(dt1$Flag_LvlTemp_C_13)

# Convert Missing Values to NA for non-dates

dt1$Reservoir <- as.factor(ifelse((trimws(as.character(dt1$Reservoir))==trimws("NA")),NA,as.character(dt1$Reservoir)))
dt1$Site <- as.factor(ifelse((trimws(as.character(dt1$Site))==trimws("NA")),NA,as.character(dt1$Site)))
dt1$ThermistorTemp_C_1 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_1))==trimws("NA")),NA,dt1$ThermistorTemp_C_1)               
suppressWarnings(dt1$ThermistorTemp_C_1 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_1))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_1))
dt1$ThermistorTemp_C_2 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_2))==trimws("NA")),NA,dt1$ThermistorTemp_C_2)               
suppressWarnings(dt1$ThermistorTemp_C_2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_2))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_2))
dt1$ThermistorTemp_C_3 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_3))==trimws("NA")),NA,dt1$ThermistorTemp_C_3)               
suppressWarnings(dt1$ThermistorTemp_C_3 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_3))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_3))
dt1$ThermistorTemp_C_4 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_4))==trimws("NA")),NA,dt1$ThermistorTemp_C_4)               
suppressWarnings(dt1$ThermistorTemp_C_4 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_4))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_4))
dt1$ThermistorTemp_C_5 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_5))==trimws("NA")),NA,dt1$ThermistorTemp_C_5)               
suppressWarnings(dt1$ThermistorTemp_C_5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_5))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_5))
dt1$ThermistorTemp_C_6 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_6))==trimws("NA")),NA,dt1$ThermistorTemp_C_6)               
suppressWarnings(dt1$ThermistorTemp_C_6 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_6))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_6))
dt1$ThermistorTemp_C_7 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_7))==trimws("NA")),NA,dt1$ThermistorTemp_C_7)               
suppressWarnings(dt1$ThermistorTemp_C_7 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_7))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_7))
dt1$ThermistorTemp_C_8 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_8))==trimws("NA")),NA,dt1$ThermistorTemp_C_8)               
suppressWarnings(dt1$ThermistorTemp_C_8 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_8))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_8))
dt1$ThermistorTemp_C_9 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_9))==trimws("NA")),NA,dt1$ThermistorTemp_C_9)               
suppressWarnings(dt1$ThermistorTemp_C_9 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_9))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_9))
dt1$ThermistorTemp_C_10 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_10))==trimws("NA")),NA,dt1$ThermistorTemp_C_10)               
suppressWarnings(dt1$ThermistorTemp_C_10 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_10))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_10))
dt1$ThermistorTemp_C_11 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_11))==trimws("NA")),NA,dt1$ThermistorTemp_C_11)               
suppressWarnings(dt1$ThermistorTemp_C_11 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_11))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_11))
dt1$ThermistorTemp_C_12 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_12))==trimws("NA")),NA,dt1$ThermistorTemp_C_12)               
suppressWarnings(dt1$ThermistorTemp_C_12 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_12))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_12))
dt1$ThermistorTemp_C_13 <- ifelse((trimws(as.character(dt1$ThermistorTemp_C_13))==trimws("NA")),NA,dt1$ThermistorTemp_C_13)               
suppressWarnings(dt1$ThermistorTemp_C_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$ThermistorTemp_C_13))==as.character(as.numeric("NA"))),NA,dt1$ThermistorTemp_C_13))
dt1$RDO_mgL_6 <- ifelse((trimws(as.character(dt1$RDO_mgL_6))==trimws("NA")),NA,dt1$RDO_mgL_6)               
suppressWarnings(dt1$RDO_mgL_6 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RDO_mgL_6))==as.character(as.numeric("NA"))),NA,dt1$RDO_mgL_6))
dt1$RDOsat_percent_6 <- ifelse((trimws(as.character(dt1$RDOsat_percent_6))==trimws("NA")),NA,dt1$RDOsat_percent_6)               
suppressWarnings(dt1$RDOsat_percent_6 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RDOsat_percent_6))==as.character(as.numeric("NA"))),NA,dt1$RDOsat_percent_6))
dt1$RDOTemp_C_6 <- ifelse((trimws(as.character(dt1$RDOTemp_C_6))==trimws("NA")),NA,dt1$RDOTemp_C_6)               
suppressWarnings(dt1$RDOTemp_C_6 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RDOTemp_C_6))==as.character(as.numeric("NA"))),NA,dt1$RDOTemp_C_6))
dt1$RDO_mgL_13 <- ifelse((trimws(as.character(dt1$RDO_mgL_13))==trimws("NA")),NA,dt1$RDO_mgL_13)               
suppressWarnings(dt1$RDO_mgL_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RDO_mgL_13))==as.character(as.numeric("NA"))),NA,dt1$RDO_mgL_13))
dt1$RDOsat_percent_13 <- ifelse((trimws(as.character(dt1$RDOsat_percent_13))==trimws("NA")),NA,dt1$RDOsat_percent_13)               
suppressWarnings(dt1$RDOsat_percent_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RDOsat_percent_13))==as.character(as.numeric("NA"))),NA,dt1$RDOsat_percent_13))
dt1$RDOTemp_C_13 <- ifelse((trimws(as.character(dt1$RDOTemp_C_13))==trimws("NA")),NA,dt1$RDOTemp_C_13)               
suppressWarnings(dt1$RDOTemp_C_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RDOTemp_C_13))==as.character(as.numeric("NA"))),NA,dt1$RDOTemp_C_13))
dt1$EXOTemp_C_1.5 <- ifelse((trimws(as.character(dt1$EXOTemp_C_1.5))==trimws("NA")),NA,dt1$EXOTemp_C_1.5)               
suppressWarnings(dt1$EXOTemp_C_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOTemp_C_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOTemp_C_1.5))
dt1$EXOCond_uScm_1.5 <- ifelse((trimws(as.character(dt1$EXOCond_uScm_1.5))==trimws("NA")),NA,dt1$EXOCond_uScm_1.5)               
suppressWarnings(dt1$EXOCond_uScm_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOCond_uScm_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOCond_uScm_1.5))
dt1$EXOSpCond_uScm_1.5 <- ifelse((trimws(as.character(dt1$EXOSpCond_uScm_1.5))==trimws("NA")),NA,dt1$EXOSpCond_uScm_1.5)               
suppressWarnings(dt1$EXOSpCond_uScm_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOSpCond_uScm_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOSpCond_uScm_1.5))
dt1$EXOTDS_mgL_1.5 <- ifelse((trimws(as.character(dt1$EXOTDS_mgL_1.5))==trimws("NA")),NA,dt1$EXOTDS_mgL_1.5)               
suppressWarnings(dt1$EXOTDS_mgL_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOTDS_mgL_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOTDS_mgL_1.5))
dt1$EXODOsat_percent_1.5 <- ifelse((trimws(as.character(dt1$EXODOsat_percent_1.5))==trimws("NA")),NA,dt1$EXODOsat_percent_1.5)               
suppressWarnings(dt1$EXODOsat_percent_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXODOsat_percent_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXODOsat_percent_1.5))
dt1$EXODO_mgL_1.5 <- ifelse((trimws(as.character(dt1$EXODO_mgL_1.5))==trimws("NA")),NA,dt1$EXODO_mgL_1.5)               
suppressWarnings(dt1$EXODO_mgL_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXODO_mgL_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXODO_mgL_1.5))
dt1$EXOChla_RFU_1.5 <- ifelse((trimws(as.character(dt1$EXOChla_RFU_1.5))==trimws("NA")),NA,dt1$EXOChla_RFU_1.5)               
suppressWarnings(dt1$EXOChla_RFU_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOChla_RFU_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOChla_RFU_1.5))
dt1$EXOChla_ugL_1.5 <- ifelse((trimws(as.character(dt1$EXOChla_ugL_1.5))==trimws("NA")),NA,dt1$EXOChla_ugL_1.5)               
suppressWarnings(dt1$EXOChla_ugL_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOChla_ugL_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOChla_ugL_1.5))
dt1$EXOBGAPC_RFU_1.5 <- ifelse((trimws(as.character(dt1$EXOBGAPC_RFU_1.5))==trimws("NA")),NA,dt1$EXOBGAPC_RFU_1.5)               
suppressWarnings(dt1$EXOBGAPC_RFU_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOBGAPC_RFU_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOBGAPC_RFU_1.5))
dt1$EXOBGAPC_ugL_1.5 <- ifelse((trimws(as.character(dt1$EXOBGAPC_ugL_1.5))==trimws("NA")),NA,dt1$EXOBGAPC_ugL_1.5)               
suppressWarnings(dt1$EXOBGAPC_ugL_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOBGAPC_ugL_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOBGAPC_ugL_1.5))
dt1$EXOfDOM_RFU_1.5 <- ifelse((trimws(as.character(dt1$EXOfDOM_RFU_1.5))==trimws("NA")),NA,dt1$EXOfDOM_RFU_1.5)               
suppressWarnings(dt1$EXOfDOM_RFU_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOfDOM_RFU_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOfDOM_RFU_1.5))
dt1$EXOfDOM_QSU_1.5 <- ifelse((trimws(as.character(dt1$EXOfDOM_QSU_1.5))==trimws("NA")),NA,dt1$EXOfDOM_QSU_1.5)               
suppressWarnings(dt1$EXOfDOM_QSU_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOfDOM_QSU_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOfDOM_QSU_1.5))
dt1$EXOTurbidity_FNU_1.5 <- ifelse((trimws(as.character(dt1$EXOTurbidity_FNU_1.5))==trimws("NA")),NA,dt1$EXOTurbidity_FNU_1.5)               
suppressWarnings(dt1$EXOTurbidity_FNU_1.5 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOTurbidity_FNU_1.5))==as.character(as.numeric("NA"))),NA,dt1$EXOTurbidity_FNU_1.5))
dt1$EXOPressure_psi <- ifelse((trimws(as.character(dt1$EXOPressure_psi))==trimws("NA")),NA,dt1$EXOPressure_psi)               
suppressWarnings(dt1$EXOPressure_psi <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOPressure_psi))==as.character(as.numeric("NA"))),NA,dt1$EXOPressure_psi))
dt1$EXODepth_m <- ifelse((trimws(as.character(dt1$EXODepth_m))==trimws("NA")),NA,dt1$EXODepth_m)               
suppressWarnings(dt1$EXODepth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXODepth_m))==as.character(as.numeric("NA"))),NA,dt1$EXODepth_m))
dt1$EXOBattery_V <- ifelse((trimws(as.character(dt1$EXOBattery_V))==trimws("NA")),NA,dt1$EXOBattery_V)               
suppressWarnings(dt1$EXOBattery_V <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOBattery_V))==as.character(as.numeric("NA"))),NA,dt1$EXOBattery_V))
dt1$EXOCablepower_V <- ifelse((trimws(as.character(dt1$EXOCablepower_V))==trimws("NA")),NA,dt1$EXOCablepower_V)               
suppressWarnings(dt1$EXOCablepower_V <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOCablepower_V))==as.character(as.numeric("NA"))),NA,dt1$EXOCablepower_V))
dt1$EXOWiper_V <- ifelse((trimws(as.character(dt1$EXOWiper_V))==trimws("NA")),NA,dt1$EXOWiper_V)               
suppressWarnings(dt1$EXOWiper_V <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$EXOWiper_V))==as.character(as.numeric("NA"))),NA,dt1$EXOWiper_V))
dt1$LvlPressure_psi_13 <- ifelse((trimws(as.character(dt1$LvlPressure_psi_13))==trimws("NA")),NA,dt1$LvlPressure_psi_13)               
suppressWarnings(dt1$LvlPressure_psi_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$LvlPressure_psi_13))==as.character(as.numeric("NA"))),NA,dt1$LvlPressure_psi_13))
dt1$Depth_m_13 <- ifelse((trimws(as.character(dt1$Depth_m_13))==trimws("NA")),NA,dt1$Depth_m_13)               
suppressWarnings(dt1$Depth_m_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$Depth_m_13))==as.character(as.numeric("NA"))),NA,dt1$Depth_m_13))
dt1$LvlTemp_C_13 <- ifelse((trimws(as.character(dt1$LvlTemp_C_13))==trimws("NA")),NA,dt1$LvlTemp_C_13)               
suppressWarnings(dt1$LvlTemp_C_13 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$LvlTemp_C_13))==as.character(as.numeric("NA"))),NA,dt1$LvlTemp_C_13))
dt1$RECORD <- ifelse((trimws(as.character(dt1$RECORD))==trimws("NA")),NA,dt1$RECORD)               
suppressWarnings(dt1$RECORD <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$RECORD))==as.character(as.numeric("NA"))),NA,dt1$RECORD))
dt1$CR6Battery_V <- ifelse((trimws(as.character(dt1$CR6Battery_V))==trimws("NA")),NA,dt1$CR6Battery_V)               
suppressWarnings(dt1$CR6Battery_V <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$CR6Battery_V))==as.character(as.numeric("NA"))),NA,dt1$CR6Battery_V))
dt1$CR6Panel_Temp_C <- ifelse((trimws(as.character(dt1$CR6Panel_Temp_C))==trimws("NA")),NA,dt1$CR6Panel_Temp_C)               
suppressWarnings(dt1$CR6Panel_Temp_C <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$CR6Panel_Temp_C))==as.character(as.numeric("NA"))),NA,dt1$CR6Panel_Temp_C))

edi_file <- dt1

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
