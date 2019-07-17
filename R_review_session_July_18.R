##############
##### a. printing hello world
##############

print("hello humans") # control + enter to run current line (where the curser is chilling)

print("hello world") # control + shift + enter to run entire file (proceed with caution)

##############
##### b. getting and setting working directory
##############

getwd() # where am I

print(getwd()) # same thing

wd = getwd() # can assign to variable if you're feeling it

print(wd) # proof it's still same thing

setwd("C://Users//kaybee//projects//r-review-session") # changes current working directory to whatever you specify

getwd() # new working directory

wd # still the old one btw

##############
##### c. using built-in data
##############

# for clean data that's pretty easy to work an experiment with
data() # this command tells me to do the below command, so ok
data(package = .packages(all.available = TRUE)) # gives me some warning messages which I ignore

data(iris)
head(iris)
View(iris)
# note the order of execution here; whatever order, just make sure you have iris 
# as a dataset in your 'Environment' (top right corner) and it shows you 150 obs. of 5 variables

nrow(iris) # another way to find that 150
# maybe assign it to a variable
reviews
sample_size = nrow(iris) # now you can always use this when calculating something like sd or mean
# albeit there are also functions for that
sep_len_mean = round(mean(iris$Sepal.Length), 2)
sep_len_mean
pet_wid_sd = round(sd(iris$Petal.Width), 4)
pet_wid_sd

# wut is sepal length, what units are these, etc.
?iris

##############
##### d. importing data from csv
##############

# for any csv data your computer can handle
getwd()
# data source: https://www.kaggle.com/zynicide/wine-
# I downloaded this and extracted to the folder... 
wine <- read.csv("C:/Users/kaybee/Projects/r-review-session/resources/winemag-data-130k-v2.csv")
# this took me about 20 seconds to load

head(wine)
?wine # there's no documentation bc we just downloaded this from the interweb

##############
##### e. installing a library
##############

##############
##### f. using a library
##############

##############
##### g. for loops
##############

##############
##### h. all the applies, what they do, what they mean
##############

##############
##### i. decision tree and/or neural network
##############

##############
##### j. connecting R to MySQL database
##############


