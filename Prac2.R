setwd("C:/CDAC/4_Python_and_R/R/Datasets")

cars93 <- read.csv("Cars93.csv", stringsAsFactors = T)
str(cars93)

survey <- read.csv("survey.csv", stringsAsFactors = T)

# Frequency Tables
table(cars93$Type)
#Compact   Large Midsize   Small  Sporty     Van 
#16      11      22      21      14       9

table(cars93$Price.Category)
#0 to 15        15 to 30 Greater than 30 
#33              48              12 

table(survey$Sex, useNA = "ifany")
#Female   Male   <NA> 
# 118    118      1 


###### Cross-Table ####
table(cars93$Price.Category, cars93$Type)
#                Compact Large Midsize Small Sporty Van
#0 to 15               6     0       2    20      5   0
#15 to 30              9     9      13     1      7   9
#Greater than 30       1     2       7     0      2   0


addmargins(table(cars93$Price.Category, cars93$Type))
#                Compact Large Midsize Small Sporty Van Sum
#0 to 15               6     0       2    20      5   0  33
#15 to 30              9     9      13     1      7   9  48
#Greater than 30       1     2       7     0      2   0  12
#Sum                  16    11      22    21     14   9  93


table(cars93$Price.Category, cars93$Type, cars93$Origin)
#                Compact Large Midsize Small Sporty Van
#0 to 15               6     0       1     7      3   0
#15 to 30              1     9       7     0      4   5
#Greater than 30       0     2       2     0      1   0


##### Proportion tables ####
a <- c(34, 90, 21, 79)

sum(a)
#[1] 224

a/sum(a)
#[1] 0.1517857 0.4017857 0.0937500 0.3526786

prop.table(a)
#[1] 0.1517857 0.4017857 0.0937500 0.3526786

prop.table(table(cars93$Price.Category))
#  0 to 15        15 to 30 Greater than 30 
#0.3548387       0.5161290       0.1290323

prop.table(table(cars93$Price.Category))*100
# 0 to 15        15 to 30 Greater than 30 
#35.48387        51.61290        12.90323

prop.table(table(cars93$Price.Category, cars93$Type))*100
# 0 to 15        15 to 30 Greater than 30 
#35.48387        51.61290        12.90323 

cars93$Affordability <- ifelse(cars93$Price>30, "Expensive", "Affordable")


table(cars93$Affordability)
#Affordable  Expensive 
#81         12 

# mean and sd
mean(survey$Pulse, na.rm = T)
#[1] 74.15104

sd(survey$Pulse, na.rm = T)
#[1] 11.68716

median(survey$Pulse, na.rm = T)
#[1] 72.5

quantile(survey$Pulse, na.rm = T)
#  0%   25%   50%   75%  100% 
#35.0  66.0  72.5  80.0 104.0

a <- seq(2,32, by=2)
a
#[1]  2  4  6  8 10 12 14 16 18 20 22 24 26 28 30 32

quantile(a, na.rm = T)
# 0%  25%  50%  75% 100% 
#2.0  9.5 17.0 24.5 32.0

####### Percentile ######
quantile(survey$Pulse, na.rm = T, probs = 0.6 )
#60% 
#76

summary(survey$Pulse)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#  35.00   66.00   72.50   74.15   80.00  104.00      45 


##### attach #####
attach(survey)

mean(Pulse, na.rm = T)
#[1] 74.15104

detach(survey)

##### Creating a function #####

add <- function(a,b,c)
{
  ans <- a+b+c
  ans
}

add(2,4,5)
#[1] 11

mts <- 45000

kms <- mts/1000
kms

m_to_k <- function(m)
{
  kms <- m/1000
  kms
}
m_to_k(23489)
#[1] 23.489

mts_to_kms <- function(mts) {
  kms <- mts/1000
  kms
}

##### Lab ####

fah <- 100

fah_to_cel <- function(fah) 
{
  cel <- (fah-32)*5/9
  cel
}

fah_to_cel(100)
#[1] 37.77778

x <- cars93$Price

CV <- function(x) 
{
  std <- sd(x, na.rm = T)
  avg <- mean(x, na.rm = T)
  cv <- (std/avg)*100
  cv
}

CV(cars93$Price)
#[1] 49.51096

g <- c(2.45, 9.22, NA, 6.43, 1.45, NA)

imputeMean <- function(g) 
{
  m <- mean(g, na.rm = T)
  imp <- ifelse(is.na(g)==T, m, g)
  imp
}

imputeMean(g)
#[1] 2.4500 9.2200 4.8875 6.4300 1.4500 4.8875

imputeMean <- function(g) 
{
  m <- mean(g, na.rm = T)
  imp <- ifelse(is.na(g)==T, m, g)
  list(imputed=imp, avg = m)
}

h <- imputeMean(g)
h
#$imputed
#[1] 2.4500 9.2200 4.8875 6.4300 1.4500 4.8875

#$avg
#[1] 4.8875

h$imputed
#[1] 2.4500 9.2200 4.8875 6.4300 1.4500 4.8875

h$avg
#[1] 4.8875

######## Dates #################
cdt1 <- "2022-11-05"

class(cdt1)
#[1] "character"

dt1 <- as.Date(cdt1)
dt1
#[1] "2022-11-05"

class(dt1)
#[1] "Date"

cdt2 <- "2022-10-31"
dt2 <- as.Date(cdt2)
class(dt2)
#[1] "Date"

dt1 - dt2
#Time difference of 5 days

unclass(dt1)
#[1] 19301

unclass(dt2)
#[1] 19296

dt3 <- as.Date("1947-08-15")
unclass(dt3)
#[1] -8175

dt4 <- as.Date("1970-01-01")
unclass(dt4)
#[1] 0

cdt1 <- "12-Jan-2022"
dt1 <- as.Date(cdt1, format = "%d-%b-%Y" )
dt1

cdt2 <- "31-March-22" 
dt2 <- as.Date(cdt2, format = "%d-%B-%y" )
dt2
#[1] "2022-01-12"

cdt3 <- "Monday, 10 October 2022"
dt3 <- as.Date(cdt3, format="%A, %d %B %Y")

dt3+5
#[1] "2022-10-15"

seq(from=Sys.Date(), length=10, by='week')
#[1] "2022-12-06" "2022-12-13" "2022-12-20" "2022-12-27" "2023-01-03" "2023-01-10"
#[7] "2023-01-17" "2023-01-24" "2023-01-31" "2023-02-07"


dt1 <- Sys.time()

### POSIXct
class(dt1)
#[1] "POSIXct" "POSIXt"

unclass(dt1)
#[1] 1670349522

### POSIXlt
dt1 <- as.POSIXlt(dt1)
unclass(dt1)
#$sec
#[1] 41.62494

#$min
#[1] 28

#$hour
#[1] 23

#$mday
#[1] 6

#$mon
#[1] 11

#$year
#[1] 122

#$wday
#[1] 2

#$yday
#[1] 339

#$isdst
#[1] 0

#$zone
#[1] "IST"

#$gmtoff
#[1] 19800

#attr(,"tzone")
#[1] ""      "IST"   "+0630"

##### Lubridate ####
library(lubridate)
cdt1 <- "12-Jan-2022"
dt1 <- dmy(cdt1)
dt1
#[1] "2022-01-12"

cdt2 <- "03-31-2022"
dt2 <- mdy(cdt2)
dt2
#[1] "2022-03-31"

cdt <- c("12-Nov-2022", "15-Jun-2022", "29-Sep-2022")
dt <- dmy(cdt)
dt
#[1] "2022-11-12" "2022-06-15" "2022-09-29"

day(dt)
#[1] 12 15 29

month(dt)
#[1] 11  6  9

year(dt)
#[1] 2022 2022 2022

wday(dt)
#[1] 7 4 5

wday(dt, label = T)
#[1] Sat Wed Thu
#Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat

month(dt) <- month(dt) + 1
dt
#[1] "2022-12-12" "2022-07-15" "2022-10-29"

##### Lab
orders <- read.csv("Orders.csv")
orders$Order.Date <- dmy(orders$Order.Date)
orders$Day <- day(orders$Order.Date)
orders$Month <- month(orders$Order.Date)
orders$Year <- month(orders$Order.Date)

orders$After1Year <- orders$Order.Date
year(orders$After1Year) <- year(orders$After1Year) + 1

##################################################################


