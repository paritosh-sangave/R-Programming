setwd("C:/CDAC/4_Python_and_R/R/Datasets")

a <- c(45, 20, 14)
barplot(a)
barplot(a ,col="blue")
b <- c(40, 20, 10)
ab <- rbind(a,b)
barplot(ab)
barplot(ab, beside = T, col = c("red","blue"))


cars93 <- read.csv("Cars93.csv")
diamonds <- read.csv2("Diamonds.csv")
barplot(table(cars93$Type), main = "Car Types")
barplot(table(cars93$Type,cars93$Origin), beside = T)

# Histogram
hist(cars93$Price, breaks = 10)
hist(diamonds$price, breaks = 10, col="violetred1")
hist(diamonds$price, breaks = 10, col= colors()[456])

# Boxplot
boxplot(cars93$Price)
boxplot(cars93$Price ~ cars93$Type)
boxplot(cars93$RPM)
boxplot(diamonds$price)
boxplot(diamonds$depth)
boxplot(diamonds$depth ~ diamonds$cut)

# Scatter Plot
plot(cars93$Price, cars93$MPG.city)
plot(cars93$Price, cars93$MPG.city, pch=18, col="skyblue2",
     xlab = "Car Price", ylab = "Milage per gallon",
     main = "Scatter")

gasoline <- read.csv("Gasoline.csv")
plot(gasoline$Week, gasoline$Sales, type = 'l')
plot(gasoline$Week, gasoline$Sales, type = 'b')

plot(density(cars93$Price))
hist(cars93$Price)

######### ggplot2 ##################
library(ggplot2)
Salaries <- read.csv("Salaries.csv", stringsAsFactors = T)

ggplot(data = Salaries, 
       aes(x=yrs.service, y=salary))+geom_point()

ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, color=rank))+geom_point()

ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, color=sex))+geom_point()

ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, shape=rank, color=sex))+geom_point()

# Bubble Plot
ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, size=yrs.since.phd,
           color=rank))+geom_point(alpha=0.3)

# Gradient Colouring
ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, color=yrs.since.phd))+geom_point()

# Histogram
ggplot(data = cars93, aes(x=Price))+
  geom_histogram(bins = 10, fill="pink", color="red")

ggplot(data = diamonds, aes(x=price))+
  geom_histogram(bins = 10, fill="pink", color="red")

# Boxplot
ggplot(data = cars93, aes(y=Price))+
  geom_boxplot(fill="pink", color="red")

ggplot(data = cars93, aes(y=Price,x=Type,fill=Type))+
  geom_boxplot()

ggplot(data = cars93, aes(y=Price,x=Type,color=Type))+
  geom_boxplot()+coord_flip()

# Density
ggplot(data = cars93, aes(x=Price))+
  geom_density(fill="pink", color="red")

ggplot(data = cars93, aes(x=Price, fill=Type))+
  geom_density(alpha=0.3)

# Line Graph
ggplot(data = gasoline, aes(x=Week, y=Sales)) +
  geom_point()+geom_line()

### Facet Grid

ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, color=rank))+
  geom_point()+facet_grid(.~rank)

ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, color=rank))+
  geom_point()+facet_grid(rank~.)

ggplot(data = Salaries, 
       aes(x=yrs.service, 
           y=salary, color=rank))+
  geom_point()+facet_grid(rank~sex)
