s <- 19
p <- 'S'
phi <- 1.618
two_phi <- phi*2

ls()
#> "p"       "phi"     "s"       "two_phi"
## names of All the objects declared

s
#> 19

p
#> "S"

phi
#> 1.618

two_phi
#> 3.236

#> Just writing name of object will print the value associated with it.

d <- c(2,3,5,7,11,s)
d
#> 2  3  5  7 11 19

class(d)
#> "numeric"

length(d)
#> 6

##
## Vectorization

d+3
#> 5  6  8 10 14 22

d*4
#> 8 12 20 28 44 76

t <- c(15, 4.67, "df")
t
#> "15"   "4.67" "df"

class(t)
#> "character"

name <- c("Bean", "Perpendicular", "Kaddu", "Babu Rao")
age <- c("35", "14", "25", "60")

## Row Bind
rb <- rbind(name, age) 
rb
#>      [,1]   [,2]            [,3]    [,4]      
#> name "Bean" "Perpendicular" "Kaddu" "Babu Rao"
#> age  "35"   "14"            "25"    "60"      

class(rb)
#> "matrix" "array" 

## Column Bind
cb <- cbind(name, age)
cb
#>      name            age 
#> [1,] "Bean"          "35"
#> [2,] "Perpendicular" "14"
#> [3,] "Kaddu"         "25"
#> [4,] "Babu Rao"      "60" 

class(cb)
#> "matrix" "array"

## Data Frame
df <- data.frame(name, age)
df
#>            name age
#> 1          Bean  35
#> 2 Perpendicular  14
#> 3         Kaddu  25
#> 4      Babu Rao  60

data(mtcars) 

disp
#> Error: object 'disp' not found

mtcars$disp
#> [1] 160.0 160.0 108.0 258.0 360.0 225.0 360.0 146.7 140.8 167.6 167.6 275.8 275.8 275.8
#> [15] 472.0 460.0 440.0  78.7  75.7  71.1 120.1 318.0 304.0 350.0 400.0  79.0 120.3  95.1
#> [29] 351.0 145.0 301.0 121.0

class(mtcars$disp)
#> [1] "numeric"

mean(mtcars$disp)
#> [1] 230.7219

sd(mtcars$disp)
# [1] 123.9387

summary(mtcars$disp)
# Min.  1st Qu.  Median  Mean   3rd Qu.   Max. 
# 71.1   120.8   196.3   230.7   326.0   472.0


###### List #######

s <- list(a=6, g=9.43, h="ftr", k=c(4,2,1,5,6))

class(s)
# [1] "list"

s$g
# [1] 9.43

s$k[4]
# [1] 5

s[2]
# [1] 9.43

s[[2]]
# [1] 9.43

s[4]
# $k
# [1] 4 2 1 5 6

s[[4]][3]
# [1] 1

s
# $a
# [1] 6

# $g
# [1] 9.43

# $h
# [1] "ftr"

# $k
# [1] 4 2 1 5 6


# Factor
name <- c("A","H","L","M","I")
age <- c(34, 78, 12, 55,45)
gdr <- c("F","M","M","F","T")
df <- data.frame(name, age, gdr)
df
#   name  age gdr
# 1    A  34   F
# 2    H  78   M
# 3    L  12   M
# 4    M  55   F
# 5    I  45   T

class(df$gdr)
# [1] "character"

df$gdr <- factor(df$gdr)

factor(df$gdr)
# [1] F M M F T
# Levels: F M T

as.integer(df$gdr)
# [1] 1 2 2 1 3

df$gdr <- factor(df$gdr, levels = c("M","F","T"))

df$gdr
# [1] F M M F T
# Levels: M F T


## Missing
d <- c(78, NA, 99, NA, 5.33, 2, 90, NaN)

is.na(d)
# [1] FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE

table(is.na(d))
# FALSE  TRUE 
# 5     3

# or
sum(is.na(d))
# [1] 3


####### Matrix #######
 
m <- matrix(c(9,3,1,5,6,3), 3, 2)
m
#      [,1] [,2]
#[1,]    9    5
#[2,]    3    6
#[3,]    1    3

m <- matrix(c(9,3,1,5,6,3), 3, 2, byrow = T) 
# by default matrix data is read by column, 
m
#      [,1] [,2]
#[1,]    9    3
#[2,]    1    5
#[3,]    6    3


m <- matrix(c(9,3,1,5,6,3), 3, 3)
#Warning message:
#  In matrix(c(9, 3, 1, 5, 6, 3), 3, 3) :
#  data length differs from size of matrix: [6 != 3 x 3]
m
#      [,1] [,2] [,3]
#[1,]    9    5    9
#[2,]    3    6    3
#[3,]    1    3    1

# Here if data length differs than size of matrix, 
# existing data will be cyclically used to fill remaining spaces

name <- c("A","H","L","M","N","F")

age <- c(34, 78, 12, 55)

rb <- rbind(name, age)
#Warning message:
#  In rbind(name, age) :
#  number of columns of result is not a multiple of vector length (arg 2)
rb
#    [,1] [,2] [,3] [,4] [,5] [,6]
#name "A"  "H"  "L"  "M"  "N"  "F" 
#age  "34" "78" "12" "55" "34" "78"

# data used cyclically

m <- matrix(c(9,3,1), 3, 3)
m
#      [,1] [,2] [,3]
#[1,]    9    9    9
#[2,]    3    3    3
#[3,]    1    1    1


a <- c(4,5,6)

b <- c(6,7,2,1,6)

rbind(a,b)
#    [,1] [,2] [,3] [,4] [,5]
# a    4    5    6    4    5
# b    6    7    2    1    6


####### Array ######
a <- array(dim = c(3,2))
a
#      [,1] [,2]
#[1,]   NA   NA
#[2,]   NA   NA
#[3,]   NA   NA

a[1,1] <- 4.56

a[1,2] <- 9

a[3,2] <- 5

a
#      [,1] [,2]
#[1,]  4.56   9
#[2,]   NA   NA
#[3,]   NA    5


###### col names #####
data("mtcars")

colnames(mtcars)
#  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" "carb"

names(mtcars)
#  [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear" "carb"

s <- list(a=6, g=9.43, h="ftr", k=c(4,2,1,5,6))

names(s)
# [1] "a" "g" "h" "k"

colnames(s)
# NULL


######## CSV ######
setwd("C:/CDAC/4_Python_and_R/R/Datasets")

getwd()
# [1] "C:/CDAC/4_Python_and_R/R/Datasets"

b2 <- read.csv("Bollywood_2015_2.csv", header = F)

colnames(b2) <- c("Movie","BO","Budget","Verdict")

b1 <- read.csv("Bollywood_2015.csv")

d1 <- read.csv2("Diamonds.csv")

d2 <- read.csv("Diamonds.csv", sep = ";", dec = ",")

mem <- read.csv("members.txt", header = T, 
                colClasses = c("character", "character", "numeric"),
                skip = 1, sep = " ")

d1 <- read.csv2("Diamonds.csv", stringsAsFactors = T)

str(d1)
#'data.frame':	53940 obs. of  10 variables:
#$ carat  : num  0.23 0.21 0.23 0.29 0.31 0.24 0.24 0.26 0.22 0.23 ...
#$ cut    : Factor w/ 5 levels "Fair","Good",..: 3 4 2 4 2 5 5 5 1 5 ...
#$ color  : Factor w/ 7 levels "D","E","F","G",..: 2 2 2 6 7 7 6 5 2 5 ...
#$ clarity: Factor w/ 8 levels "I1","IF","SI1",..: 4 3 5 6 4 8 7 3 6 5 ...
#$ depth  : num  61.5 59.8 56.9 62.4 63.3 62.8 62.3 61.9 65.1 59.4 ...
#$ table  : num  55 61 65 58 58 57 57 55 61 61 ...
#$ price  : int  326 326 327 334 335 336 336 337 337 338 ...
#$ x      : num  3.95 3.89 4.05 4.2 4.34 3.94 3.95 4.07 3.87 4 ...
#$ y      : num  3.98 3.84 4.07 4.23 4.35 3.96 3.98 4.11 3.78 4.05 ...
#$ z      : num  2.43 2.31 2.31 2.63 2.75 2.48 2.47 2.53 2.49 2.39 ...


########## Reading Excel File ###########
library(xlsx)

bnk <- read.xlsx("bankruptcy.xlsx", 3) 

# or

#library(readxl)

####### Exporting #######

data("ChickWeight")

write.csv(ChickWeight, "C:/CDAC/4_Python_and_R/R/Day1/ChickWeight.csv")


#### Subsetting a matrix ####

m = matrix(1:12, 4,3)
m
#      [,1] [,2] [,3]
#[1,]    1    5    9
#[2,]    2    6   10
#[3,]    3    7   11
#[4,]    4    8   12

m[3,] # 3rd row
#[1]  3  7 11

m[c(2,4), ] # 2nd and 4th row
#      [,1] [,2] [,3]
#[1,]    2    6   10
#[2,]    4    8   12

d1 <- read.csv2("Diamonds.csv", stringsAsFactors = T)
d1$clarity
#[1] SI2  SI1  VS1  VS2  SI2  VVS2 VVS1 SI1  VS2  VS1  SI1  VS1  SI1  SI2  SI2  I1   SI2 
#[18] SI1  SI1  SI1  SI2  VS2  VS1  SI1  SI1  VVS2 VS1  VS2  VS2  VS1  VS1  VS1  VS1  VS1 
#[35] VS1  VS1  VS1  SI1  VS2  SI2  SI2  SI1  VS2  VS1  SI2  SI1  SI2  SI2  VS2  SI2  SI1 
#[52] VS1  SI1  VS2  VS2  SI2  SI2  SI1  SI1  SI1  VS1  SI1  SI1  SI1  SI2  VVS2 VVS1 SI1 
#[69] SI1  VVS1 VVS1 SI1  SI1  SI1  SI1  VVS2 VVS2 VVS2 VVS2 VVS1 VVS1 VVS1 VVS2 SI2  VVS1
#[86] VVS1 VVS1 VVS1 VVS2 SI1  SI1  SI2  VS2  VS2  SI2  VS2  VS1  SI2  SI1  SI1  SI1  SI1 
#[103] SI1  VS2  VS1  SI1  SI1  VVS2 SI2  VVS2 SI2  SI2  VS2  SI1  VS2  VS2  SI2  VS2  VS2 
#[120] SI2  SI2  SI1  VS2  VS2  VS2  VS2  SI1  VVS2 SI2  SI2  VS2  SI1  SI1  VS2  VS1  VVS1
#[137] VS1  VS1  SI1  VVS1 VS2  VS2  VS2  VS1  SI2  VVS2 VS1  SI1  SI1  SI1  SI2  SI1  VS2 
#[154] VS2  SI1  SI2  SI1  VS2  VS1  SI2  VS2  VVS2 SI1  VS2  SI2  VVS1 SI2  VVS1 VVS1 VS2 
#[171] SI2  VS2  I1   VS1  SI1  VS2  VS2  VS2  VS2  VS2  VVS2 VVS2 SI1  SI1  VS2  SI1  VS1 
#[188] VS2  VS2  VS2  VS2  VS2  VS2  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  VS2 
#[205] SI2  SI1  SI1  VVS1 VS2  SI1  VS2  VS2  VS2  VS1  VS1  I1   SI1  SI1  VS1  VVS2 VS2 
#[222] VS1  VS1  SI2  SI1  SI1  SI1  SI1  SI1  IF   VS2  VS1  VS2  VVS1 VS1  VVS1 VS1  VVS2
#[239] VS2  VS1  SI1  I1   SI2  SI1  SI1  SI1  SI1  SI2  SI2  SI1  IF   SI2  VVS2 VVS1 VS1 
#[256] SI2  IF   VVS1 SI2  VS1  VS1  SI1  SI1  SI1  SI1  SI1  VS1  VS1  VVS2 VS1  SI1  VS2 
#[273] VS2  VS2  VS2  SI1  VS2  VVS2 SI2  VS1  SI2  IF   VS2  VS2  SI2  SI1  SI2  SI1  SI1 
#[290] SI1  SI1  VVS2 VVS1 VS2  VS1  VS1  VVS1 SI2  SI2  VS2  VS1  SI2  SI2  SI1  IF   SI2 
#[307] VS1  SI2  SI1  SI1  SI1  VS1  VS1  IF   VS1  I1   VS2  VS2  SI1  VS2  VS2  VS2  VS2 
#[324] I1   SI2  SI2  IF   VS2  VS1  VS2  SI1  VS2  SI1  VS1  VS2  VS2  VS1  VS2  VS2  VS2 
#[341] VS1  SI2  VS2  VS2  SI2  SI1  VS1  VS1  VS2  SI1  SI1  SI1  SI1  VS2  VS2  SI2  VVS1
#[358] VS2  VS2  VS2  VS2  SI1  VVS1 SI1  VS1  VS1  SI2  VS2  VS1  I1   VS2  VVS2 SI1  SI1 
#[375] SI2  SI1  I1   VS1  VS1  SI2  VS1  SI1  SI1  SI1  VS2  SI2  VS1  VS2  SI1  VS2  SI1 
#[392] SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI1  SI2  VS1  VS1  SI1 
#[409] VS2  VS2  VS1  VS1  VS1  VS1  SI1  I1   VS2  VS2  VS2  VS1  VS2  VS2  SI1  SI1  VS2 
#[426] VVS1 SI2  SI1  VS2  SI1  SI1  SI1  VVS1 SI2  VS1  SI1  SI1  SI1  SI1  VS2  SI2  SI2 
#[443] VS2  SI2  I1   VVS2 VVS2 VS1  SI1  SI2  SI1  SI1  VVS2 VS2  VS2  VVS2 SI1  SI1  SI1 
#[460] SI1  VS2  SI1  VS2  VS2  VS2  I1   SI2  SI1  VS1  VS1  VS2  VS1  SI2  VS1  VS1  VS1 
#[477] SI2  VS1  SI1  VS2  VVS1 SI1  SI1  SI1  SI1  SI1  SI1  VS1  VS2  VS2  VS2  VS2  VVS2
#[494] VVS1 SI1  SI1  SI1  SI1  SI1  VS2  SI1  VS2  VS2  SI1  SI1  SI1  SI1  VS2  VS2  SI1 
#[511] SI2  SI1  VS2  VVS2 SI2  SI1  VS2  VVS2 VS1  SI2  SI2  VS1  SI1  VS1  SI1  I1   SI2 
#[528] VS1  VS1  SI2  VS1  VS2  VS1  SI2  SI1  I1   SI1  VS2  VVS2 VVS1 VVS1 SI2  SI2  VS1 
#[545] SI2  VVS1 VS1  SI2  SI2  VS2  SI1  I1   VVS1 VVS1 VS2  SI1  SI2  SI1  SI1  SI1  SI1 
#[562] VS2  SI2  VVS2 SI1  SI1  VS1  SI1  VS2  IF   VS2  VS2  VVS2 SI2  SI1  VS2  VS2  VVS1
#[579] VVS1 VS2  SI1  SI2  SI2  VS1  VVS2 VS2  VS2  SI1  VS2  SI1  VS2  VS1  VS1  SI1  SI1 
#[596] SI1  VS1  VS2  VS2  VS1  VS2  SI1  VS2  VS2  VS1  SI1  VS1  VS1  VS1  VS1  VS1  VS1 
#[613] VS1  VS2  VS2  VS1  VVS2 VS1  VS2  VS1  VS1  SI2  SI1  VS2  SI2  SI2  VVS1 VS2  VS1 
#[630] SI1  SI2  SI2  SI2  VVS1 I1   SI1  SI1  VS2  VS1  VS1  VS2  VS2  VS2  VS2  SI2  SI1 
#[647] VVS2 VS1  VS2  SI2  VVS2 SI1  VS1  I1   I1   VS2  VS2  VS2  VS2  SI2  SI1  VS1  VVS2
#[664] SI2  I1   SI1  SI1  VS2  SI1  VS2  VS1  SI1  SI1  SI1  VVS2 VVS2 SI2  SI1  VS1  VS2 
#[681] VS2  SI1  I1   SI1  VS1  SI2  SI1  SI1  IF   VS1  SI1  SI1  SI1  VS2  VS1  SI2  SI2 
#[698] SI1  VS1  VS1  VS1  I1   VS2  VS2  VS2  VS2  SI1  VS1  VVS2 VS2  SI1  VS2  SI2  SI1 
#[715] SI2  SI2  VVS2 SI2  I1   SI1  VS1  VS1  SI1  VS2  SI1  SI1  SI1  VS2  SI1  VS2  VVS1
#[732] VVS1 VVS1 VVS1 VVS1 VVS1 VS2  VS1  VS1  SI2  SI2  SI2  SI2  SI2  VS1  VS1  VS1  SI1 
#[749] SI1  SI1  SI2  SI1  SI1  VVS2 SI2  SI1  VS2  SI1  VVS2 SI1  SI1  VS2  VS2  VS2  VS2 
#[766] SI1  SI1  SI1  VS2  VVS2 SI2  VS2  VS2  VS2  VS1  VS1  VS2  VS1  SI2  VS2  SI2  VVS2
#[783] VS1  VVS1 SI1  VVS2 VVS2 SI1  IF   SI2  VS1  SI1  SI1  SI2  SI1  VVS1 VS2  VS2  VS1 
#[800] VS2  I1   SI2  VS2  VS2  SI1  SI1  SI2  SI1  SI1  SI1  SI1  SI1  SI1  SI1  VS2  VVS2
#[817] SI1  VS2  SI1  VS2  SI2  VS2  SI1  VVS1 VVS1 VS1  VVS1 SI1  VVS1 VS2  VVS1 VS2  SI2 
#[834] SI2  VVS1 SI2  SI2  SI2  SI1  SI2  VS1  IF   SI2  SI1  I1   SI1  IF   VVS2 VVS2 VVS2
#[851] SI2  VVS2 SI1  SI1  SI1  VS2  VS1  I1   SI1  SI1  SI1  SI1  SI1  SI1  SI1  I1   SI2 
#[868] SI1  SI1  SI1  SI1  SI1  VS2  SI1  SI1  VS2  SI1  SI2  SI2  SI1  SI1  SI1  SI1  SI1 
#[885] SI1  SI1  VS2  VS2  VS1  VS1  VVS2 VS1  VS1  VS1  VVS2 SI2  SI1  VS1  SI1  SI2  VS1 
#[902] VS2  VS1  VS1  VS2  VVS1 VS1  SI1  SI1  SI2  VS2  SI1  SI1  IF   VS1  VS1  SI2  SI2 
#[919] SI2  VS1  VS1  SI2  SI1  VVS1 VS2  I1   IF   VVS1 VS2  SI1  VS2  SI1  SI2  SI2  SI2 
#[936] SI1  SI1  SI2  SI1  SI2  SI1  SI1  SI1  VS1  VS1  VVS2 VS2  VS1  SI2  VS1  VVS2 VVS2
#[953] SI1  VS2  SI1  SI1  SI1  SI1  SI1  VVS1 VS2  VS2  VS2  VS2  SI1  VS2  SI2  I1   VS1 
#[970] SI2  VVS2 VS2  VVS1 SI2  SI2  SI1  SI1  SI2  SI2  SI1  VS2  VS1  VVS2 VS1  VS2  VS2 
#[987] VVS1 SI1  SI2  SI2  SI1  I1   I1   VVS2 SI1  VVS2 SI1  VS1  VS2  SI2 
#[ reached getOption("max.print") -- omitted 52940 entries ]
#Levels: I1 IF SI1 SI2 VS1 VS2 VVS1 VVS2

d1[,4] #
# large data o/p

d1[, c(4,6)]

df <- d1[1:50, c(4,6)] # 50 records taken in df from col no 4, and 6

df <- d1[-c(1:50), -c(4,6)] # everything except first 50 records and 4 and 6 no. col


###### Subsetting the data frame ####

b1 <- read.csv("Bollywood_2015.csv")

ss <- subset(b1, BO_Collection > 50 & Budget > 70)

ss2 <- subset(b1, BO_Collection > 50 & Budget > 70, 
              select = c(Movie_Name, BO_Collection))

###### Lab #####

# 1.
orders <- read.csv("Orders.csv", stringsAsFactors = T)
ss_orders <- subset(orders, Payment.Terms=="Online")

# 2.
data("mtcars")
write.csv(mtcars, "/mtcars.csv")

# 3.
d1 <- read.csv2("Diamonds.csv", stringsAsFactors = T)
ss_d1 <- subset(d1, cut=="Premium" & color=="J")

# 4.
ss2_d1 <- subset(d1, select = c(carat, color, depth, price))

# 5.
ss_mtcars <- mtcars[c(2,18,30,12),]

## Link.txt

b_data <- read.csv("C:/Training/Academy/Stats Exercises/breast-cancer-wisconsin.data",
                   header=F)
colnames(b_data) <- c("sampleID","clump","Uni_size", "Uni_shape","marg_adh",
                      "epith","bare_nuc","b_chrom","n_nucl","mitosis","Class")

