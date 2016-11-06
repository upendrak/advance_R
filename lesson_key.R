# arthimetics calculation
2 + 3

# assigning variable
x <- 3
x = 3
x
y <- 4
y

# Plotting in R
x <- c(1,2,3)
y <- c(3,4,1)
plot(x,y)

# class of variables
class(x)
length(x)
class(y)
length(y)

# Strings 
str <- "This is my first script"
"this is my first script" -> str2
str2
class(str)
length(str)
# clear your variables
ls() #this will 

rm(list = ls())

# functions
?mean
?sd
?max
 
# creating function
# name of the function
# function statement
# some argument
# body
# return statement (#optional)

my_sum <- function(input_1, input_2) {
  tot = input_1 + input_2
  #return(tot) # return is optional
  tot
}

# Assigning values
input_1 = 3
input_2 = 4
input_1 + input_2

# Calling a function
my_sum(input_1=2,input_2=4)
my_sum(input_1=4,input_2=5)
my_sum(input_1, input_2)

# Native function in R
sum(input_1+input_2)

# How about converting fah to kelvin
fah_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

fah_to_kelvin(temp=32)
fah_to_kelvin(32)
fah_to_kelvin("test") # wrong input

# How about converting Kelvin to Celsius
kel_to_cel <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

kel_to_cel(0)
new = "some test" - 57

# Now the exercise
# Write a function to convert Fahreinhet to Celsius "fah_to_celsius"
# and test it with fah_to_celsius(temp=32)

fah_to_celsius_1 <- function(temp) {
  celsisus = (temp - 32) * (5 / 9)
  return(celsisus)
} 

fah_to_celsius_2 <- function(temp) {
  temp_k <- fah_to_kelvin(temp)
  result <- kel_to_cel(temp_k)
  return(result)
}

fah_to_celsius_1(temp=32)
fah_to_celsius_2(temp=32)

# Exercise 2
best_practice <- c("write", "programs", "for", "people", "not", "computers")
asterix <- "***"

# So i want you to write a function called "fence" that takes two arguments and returns
# a new vector something like asterix at the beginning and at the end
# Expected output
"***", "write", "programs", "for", "people", "not", "computers", "***"

fence <- function(best_practice,aste) {
  result <- c(input2,input1,input2)
  return(result)
}

fence(input1 = best_practice, input2 = asterix)

# Clear the functions - fah_to_kelvin and kel_to_cel
rm(fah_to_kelvin)
rm(kel_to_cel)

# Now call fah_to_cel_functions.R script to convert fah_to_celsius
source("fah_to_cel_functions.R")

fah_to_kelvin(temp=32)
kel_to_cel(0)
fah_to_celsius(0)


# Now doing something with real dataset
dir.create("data") # create a directory
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder.csv")
?dir.create

dat <- read.csv("data/gapminder.csv", header=TRUE)
head(dat)
summary(dat)
str(dat)

# Write a functioin called analyze that takes country as argument and 
# displays mean, min and mx lifeExp of that country
# subsetting the df
country_name <- subset(dat, dat$country == "Uganda")
head(country_name)
summary(country_name)
# Calculate mean, min and max of lifExp
mean(country_name[,5])
min(country_name[,5])
max(country_name[,5])

# Function now
analyze <- function(countr) {
  country_name <- subset(dat, dat$country == countr)
  print(mean(country_name$lifeExp))
  print(min(country_name$lifeExp))
  print(max(country_name$lifeExp))
  out <- c("Mean_le" = mean(country_name$lifeExp), 
           "Min_le" = min(country_name$lifeExp), 
           "Max_le" = max(country_name$lifeExp))
  plot(country_name$year, country_name$lifeExp, xlab="Year", ylab="Life Expectancy", 
       main=countr)
  print(out)
}
analyze("Uganda")
analyze("Albania")

# Exercise
# Modify the analyze function to generate a plot with "year" on x-axis and "lifeExp" on 
# y-axis

best_practice

best_practice_fun <- function(some_argument) {
  print(some_argument[1])
  print(some_argument[2])
  print(some_argument[3])
  print(some_argument[4])
  print(some_argument[5])
  print(some_argument[6])
}

best_practice_fun(best_practice)

for (w in best_practice) {
  print(w)
}

best_practice_fun2 <- function(some_argument) {
  for (w in some_argument) {
    print(w)
  }
}

best_practice_fun2(best_practice)

# Generate a file that contains years "1952" and "1997" and name it as  gapminder_52_97 
# and another file that contains years "1967" and "2007 and name it as gapminder_67_07
# hint: Use subset with && 
# subset(dat, dat$country == "Uganda")
gapminder_52_97 <- subset(dat, dat$year == 1952 | dat$year == 1997)
head(gapminder_52_97)

gapminder_67_07 <- subset(dat, dat$year == 1967 | dat$year == 2007)
head(gapminder_67_07)

# Writing a dataset
write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE, quote = FALSE)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE, quote = FALSE)

# Listing the files with a pattern in a directory
list.files(path = "data", pattern = ".csv", full.names = TRUE)

# Exercise
# write a for loop to print each filename on a different line for the 
# above output
filenames <- list.files(path = "data", pattern = ".csv", full.names = TRUE)

for (f in filenames) {
  print(f)
}

# Exercise:
# Using the function your wrote this morning to print out 
# the results from multiple data-sets

analyze_data <- function(file, countr) {
  file_out <- read.csv(file, header = TRUE)
  country_name <- subset(file_out, file_out$country == countr)
  out2 <- c("Mean_le" = mean(country_name$lifeExp), 
           "Min_le" = min(country_name$lifeExp), 
           "Max_le" = max(country_name$lifeExp))
  print(file)
  print(countr)
  print(out2)
  plot(country_name$year, country_name$lifeExp, xlab="Year", ylab="Life Expectancy", 
       main=countr) 
}
analyze_data("data/gapminder.csv", "Uganda")

analyze_all <- function(pattern, countr) {
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze_data(f,countr )
  }
}
analyze_all(".csv", "Uganda")