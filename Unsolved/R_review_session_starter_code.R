##############
##### a. printing hello world
##############

# print hello world


##############
##### b. getting and setting working directory
##############

# how do you get the working directory?


# how do you set the working directory to another location?


##############
##### c. using built-in data
##############

# RStudio provides some build-in datasets that tends to be cleaned and pretty easy to work an experiment with

data() # this command tells me to do the below command, so let's try it.
data(package = .packages(all.available = TRUE)) # what does this do?

# find yourself an interesting built-in package and store it to Global Environment here


# use ?<package-name> to find out more about that package


# View the data set


# examine the first few rows of the dataset with the head function


# use some R functions to learn about your dataset


##############
##### d. import and clean data from csv
##############

# use read.csv to import data downloaded from Kaggle, data.gov or some other (reliable) source
# HINT: store (extract if zip) your downloaded data to your working directory


# how many observations in this dataset? how many fields?


# use View to examine the dataset closer. does this dataset have a primary key, or unique ID? if so, set it as the R dataframe id here:


# enter data source here or in readme file: 


##############
##### e. datatypes
##############

# define the following R datatypes:

# factor - 
# character - 
# int - 
# num - 
# double - 
# [atomic] vector - 
# list - 
# array - 
# matrix - 

# which of the above data types are also in python?
# what are they called in python?

# what are the data types for each of the objects below?
vec <- 1:10


c_thing <- c(1:10)


lst = list(1:10)


mtx <- matrix(0, 2, 5)


##############
##### f. creating functions and cleaning data
##############

# create a function which calculates the mode for any given parameter x
# BONUS if you can use the function on both categorical and numerical variables.

Mode <- function(x) {
  # insert code here
}

# then use the function on a column of a dataset here. test the results/output to make sure it worked as expected.


##############
##### g. for loops
##############

# write a for loop that prints each element in a list or vector


# write a for loop that takes a list or vector (containing numericals only) and applies some math function to it (ex. squares each element)


##############
##### h. functionals
##############

lst = list(1,2,3,4)
vec = c(100, 200, 500, 600)
mtx = matrix(0, 1, 2)

funlala <- function(param) {
  param %% 3
}

# use the above collections and function to use the lapply, sapply, vapply, and apply methods:

### lapply


### sapply


### vapply


# what is the difference between sapply and vapply?


### apply


##############
##### i. installing a library
##############

# install the neuralnet package


##############
##### j. using a library
##############

# 'use' or import the neuralnet package


# how many times do you need to install package? when do you use library(<package>)?


# when do you use the quotes and when do you not?


##############
##### k. handling missing data
##############


# check for missing values in entire dataset


# check for missing values per column:


# by the way, the above is the same as doing:


# check for missing values in a particular column, Vehicles.involved


# how to handle missings depends on a number of factors
# some common ways involve replacing with the mean, median, or mode (depending on dataset, industry, datatypes),
# or simply removing those rows (for larger datasets)
# handling missing values is important because some R packages cannot handle there being missings (although some can)


##############
##### l. handling outliers
##############

# how to obtain outliers


# how to replace outliers with the mode (or mean, median)


# when would you replace outliers with mode versus the mean? mean versus median?



##############
##### m. scale (or "normalize") the data
##############

# first step with neural network is to scale numerical columns to values between 0 and 1
# this is the formula: (x - min(x)) / (max(x) - min(x))
# this means you need min and max per (numerical) variable. in other words, you need to apply min and max functions.
# minx <- min(x) but on all the variables (apply functional)

# use an apply method to normalize the numerical data

# first it may help to use an sapply and is.numeric and is.factor to parse numerical and categorical variables


# formula for setting numerical data to values between 0 and 1 : (x - min(x)) / (max(x) - min(x))
# there's a function for it called scale, but you need mins and maxes first
# since there are multiple, can use apply function


# then can use scale function


# can use the dummy library to convert the categorical variables


#then re-bind the data into a single dataframe


##############
##### n. dividing data into test/train set
##############

# divide your data into 2 parts. 1 part test, and one part training, with a 67%/33% split
# HINT: use the sample function
# make sure to set the seed


##############
##### o. build a neural network model
##############

# https://cran.r-project.org/web/packages/neuralnet/neuralnet.pdf
?neuralnet

# create a neural network with 5 hidden neurons in a single input layer


# create another model with 2 hidden layers, the first with 3 neurons and the second layer with 2, we could have done hidden = c(3,2).


# what does linear.output = T mean?

# plot the neural networks

