setwd("C:/CDAC/4_Python_and_R/R/Datasets")
library(tidyverse)
A <- read.csv("A.csv")
B <- read.csv("B.csv")

inner_join(A,B, by="IdNum")

orders <- read.csv("Orders.csv")
details <- read.csv("Ord_Details.csv")

o_details <- inner_join(orders, details, by="Order.ID")

# Gathering
table4a

gather(table4a, `1999`,`2000`, key = "year", value = "cases")

pivot_longer(table4a, c(`1999`,`2000`),
             names_to = "year", values_to = "cases")

# Spreading
table2


spread(table2, key = "type", value = "count" )

pivot_wider(table2, names_from = "type", values_from = "count")

# Separate

table3
separate(table3, rate, into = c("cases","pop"), convert = T)

separate(table3, year, into = c("century","year"), sep = 2)
separate(table3, year, into = c("cent1","cent2","year"), sep = c(2,3))

# paste
a <- "Machine"
b <- "Learning"
paste(a,b)
paste0(a,b)

# Unite
table5
unite(table5, new_col, century, year)
unite(table5, new_col, century, year, sep="")

# Missings
stocks <- data.frame(
  year = c(2015,2015,2015,2015,2016,2016,2016),
  qtr = c(1,2,3,4,2,3,4),
  return = c(1.88, 0.59, 0.35, NA, 0.92, 0.17, 2.66)
)

drop_na(stocks)
complete(stocks, year, qtr)
mu <- mean(stocks$return, na.rm = T)
complete(stocks, year, qtr, fill = list(return=mu))

# Filling
TVrate <- data.frame(channel=c("A",NA, NA, "B", NA, NA, NA),
                     ratings = c(2,3,4,5,6,7,2))

fill(TVrate, channel)

stocks %>% 
  complete(year, qtr) %>% 
  fill(return)

stocks %>% 
  complete(year, qtr) %>% 
  fill(return, .direction = "up")

### Lab
#1.
comb1 <- read.csv("comb1.csv")

dt_comb1 <- pivot_longer(comb1,c(Highlighter, Marker, Pen, Refill),
                         names_to = "ItemType", values_to = "qty")

#OR
dt_comb1 <- pivot_longer(comb1,-District ,
                         names_to = "ItemType", values_to = "qty")

#2.

comb2 <- read.csv("comb2.csv")

dt_comb2 <- separate(comb2, PatientID, 
                     into = c('projectID', 'SiteID', 'PatientNumber'),
                     sep="[/-]")

#3.

quality <- read.csv("quality.csv")

qual_long <- pivot_longer(quality, -Id, names_to = "Category",
                          values_to = "scores")
