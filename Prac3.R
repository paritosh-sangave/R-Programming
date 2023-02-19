library(tidyverse)
setwd("C:/CDAC/4_Python_and_R/R/Datasets")

cars93 <- read.csv("Cars93.csv")

# Sorting
s_cars <- arrange(cars93, Price)
s_cars <- arrange(cars93, Type)
s_cars <- arrange(cars93, Type, Price)
s_cars <- arrange(cars93, Type, desc(Price) ) # desc = Descending order

# Selecting the columns
sel_cars <- select(cars93, Model, Type, Price)
sel_cars <- select(cars93, Model:Max.Price)
sel_cars <- select(cars93, starts_with("MPG"))
sel_cars <- select(cars93, ends_with("Price"))
sel_cars <- select(cars93, contains("in"))

# Subsetting
ss_cars <- filter(cars93, Type=="Compact")
ss_cars <- filter(cars93, Type=="Compact" & Price>20)
ss_cars <- filter(cars93, Type=="Compact" | Price>20)
ss_cars <- filter(cars93, Manufacturer %in% c("Audi","Ford"))

# Renaming the columns
r_cars <- rename(cars93, Minimum=Min.Price, Maximum=Max.Price)

# Adding new columns
m_cars <- mutate(cars93, Price_range=Max.Price-Min.Price,
                 Ratio=Weight/Passengers)

# Summarizing
summarise(cars93, avg_price = mean(Price, na.rm=T))
summarise(cars93, avg_price = mean(Price, na.rm=T), 
          sd_price=sd(Price, na.rm=T))

# Grouped Summary
grp_cars <- group_by(cars93, Type)
summarise(grp_cars, avg_price = mean(Price, na.rm=T), 
          sd_price=sd(Price, na.rm=T))

cars93 %>% 
  group_by(Type) %>% 
  summarise(avg_price = mean(Price, na.rm=T), 
            sd_price=sd(Price, na.rm=T))

ss_cars <- cars93 %>% filter(Type=="Compact" & Price>20)

ss_cars <- cars93 |> filter(Type=="Compact" & Price>20)




