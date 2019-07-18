##############
##### a. printing hello world
##############

# print hello world


##############
##### b. getting and setting working directory
##############

# how do you get the working directory?


# how do you set the working directory?


##############
##### c. using built-in data
##############

# for clean data that's pretty easy to work an experiment with
data() # this command tells me to do the below command, so ok
data(package = .packages(all.available = TRUE)) # gives me some warning messages which I ignore

# find yourself an interesting built-in package

# use ?<package-name> to find out more about that package


##############
##### d. importing data from csv
##############

# for any csv data your computer can handle
# hint: use Kaggle or data.gov for reliable data


##############
##### e. datatypes and creating functions
##############

# factor - 
# character - 
# int - 
# num - 
# double - 
# [atomic] vector - 
# list - 
# array - 
# matrix - 

# which of the above data types are also in python? what are they called in python?

# what are the data types for each of the objects below?
vec <- 1:10

c_thing <- c(1:10)

lst = list(1:10)

mtx <- matrix(0, 2, 5)

# create a function which calculates the mode for any given parameter x
# BONUS if you can use the function on both categorical and numerical variables.

Mode <- function(x) {
  
}

# then use the function on a column of a dataset.


##############
##### f. for loops
##############

# write a for loop that prints each element in a list or vector


##############
##### g. functionals
##############

lst = list(1,2,3,4)
vec = c(100, 200, 500, 600)
mtx = matrix(0, 1, 2)

funlala <- function(param) {
  param %% 3
}

# use the above collections and function to use the lapply, sapply, and apply methods

### lapply

### sapply

### apply


##############
##### h. installing a library
##############

# install the neuralnet package


##############
##### i. using a library
##############

# 'use' or import the neuralnet package


# how many times do you need to install package? when do you use library(<package>)?


##############
##### j. handling missings and outliers
##############


##############
##### k. normalize the data
##############

# first step with neuron net is to normalize
# normalizing the data transforms it such that the mean is 0 and the standard deviation is 1.
# so you need min and max per (numerical) variable. min and max functions.
# minx <- min(x) but many variables, so use apply function
# use an apply method to normalize the numerical data


##############
##### l. scale the data
##############

# formula for setting numerical data to values between 0 and 1 : (x - min(x)) / (max(x) - min(x))
# there's a function for it called scale, but you need mins and maxes first
# since there are multiple, can use apply function

# then can use scale function


##############
##### m. dividing data into test/train set
##############

# 


##############
##### n. build a neural network model
##############

# create a neural network with 4 nodes, 2 hidden layers, using 
# https://cran.r-project.org/web/packages/neuralnet/neuralnet.pdf


