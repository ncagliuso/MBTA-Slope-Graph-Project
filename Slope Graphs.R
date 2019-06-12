#Slope Graphs Project
#Nick Cagliuso
#This project creates a slope graph of reqs by Buyer Team by Quarter over the first 3 Quarters of the Fiscal Year

library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(openxlsx)
setwd("C:/Users/NCAGLIUSO/Desktop")
REQ_TO_PO_SPILT_PO_SIDE_PUBLIC <- read.xlsx("C:/Users/NCAGLIUSO/Desktop/REQ_TO_PO_SPILT_PO_SIDE_PUBLIC.xlsx")

REQ_TO_PO_SPILT_PO_SIDE_PUBLIC <- REQ_TO_PO_SPILT_PO_SIDE_PUBLIC %>% filter(.data$PO_Line == 1)
sourcing_execs <- (Buyer = c("AFLYNN", "TDIONNE","EWELSH", "RWEINER", "JDELALLA","KHALL","JMOYNIHAN"))
inventory_buyers <- (Buyer = c("AKNOBEL", "DMARTINOS", "KLOVE", "PHONG", "TSULLIVAN1", "NSEQUEA", "DWELCH"))
non_inventory_buyers <- (Buyer = c("CFRANCIS", "JKIDD", "JLEBBOSSIERE", "TTOUSSAINT","IATHERTON","JMIELE"))
REQ_TO_PO_SPILT_PO_SIDE_PUBLIC <- REQ_TO_PO_SPILT_PO_SIDE_PUBLIC %>% mutate(Buyer_Team = case_when(
  .data$Buyer %in% sourcing_execs ~ "SE",
  .data$Buyer %in% inventory_buyers ~ "INV",
  .data$Buyer %in% non_inventory_buyers ~ "NINV"
))

Count_Table <- REQ_TO_PO_SPILT_PO_SIDE_PUBLIC %>% group_by(.data$Quarter, .data$Buyer_Team) %>% 
  summarise(cnt = n())
#Gives requisition count of each Buyer Team over each Quarter

ggplot(data = Count_Table, aes(x = Quarter, y = cnt, group = Buyer_Team)) +
  ggtitle("Reqs by Buyer Team by Quarter") +
  geom_line(aes(color = Buyer_Team), size = 1) + 
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_label(aes(label = cnt), 
             size = 2.5, 
             label.padding = unit(0.05, "lines"), 
             label.size = 0.0)

#geom_line colors each line by Buyer Team and shows the key
#geom_label places the count at each data point over the graph
#graph source: https://ibecav.github.io/slopegraph/
  
