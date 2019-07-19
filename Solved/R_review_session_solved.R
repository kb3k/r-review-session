##############
##### a. printing hello world
##############

# print hello world

print("hello world")


##############
##### b. getting and setting working directory
##############

# how do you get the working directory?

getwd()

print(getwd())


wd = getwd() # can assign to variable if you're feeling it (Note this goes into your global Environment)

print(wd) # proof it's still same thing


# how do you set the working directory?

# setwd("<where-you-did-git-clone>//r-review-session")


getwd() # new working directory

wd # still the old one btw


##############
##### c. using built-in data
##############

# RStudio provides some build-in datasets that tends to be cleaned and pretty easy to work an experiment with

data() # this command tells me to do the below command, so ok
data(package = .packages(all.available = TRUE)) # what does this do?


# find yourself an interesting built-in package and store it to Global Environment here
data(iris)


# use ?<package-name> to find out more about that package
?iris


# View the data set
View(iris) # after this step, we see the 150 obs. of 5 variables show up in G.E.


# examine the first few rows of the dataset with the head function
head(iris) # sneak peak without opening up a thing


# use some R functions to learn about your dataset
nrow(iris)
sample_size = nrow(iris) # why would I do this?

sep_len_mean = round(mean(iris$Sepal.Length), 2)
sep_len_mean
pet_wid_sd = round(sd(iris$Petal.Width), 4)
pet_wid_sd


##############
##### d. import and clean data from csv
##############

# use read_csv to import data downloaded from Kaggle, data.gov or some other (reliable) source
# HINT: store (extract if zip) your downloaded data to your working directory

getwd() # working directory should include repository name r-review-session (see line 64)

accidents <- read.csv("resources/barcelona-data-sets/accidents_2017.csv")

# Note: if wd did not incl. r-review-session would need to incl. that in the read.csv argument path
colnames(accidents)

# how many observations in this dataset? how many fields?
head(accidents)
?accidents # there's no documentation bc we just downloaded this from the interweb

# use View to examine the dataset closer. does this dataset have a primary key, or unique ID? if so, set it as the R dataframe id here:
View(accidents)
# we have 10335 unique rows, but dataset has 10339. so that's bad.

#install.packages("dplyr")
library(dplyr)
accidents <- distinct(accidents) # removes duplicates
# note the number of rows is now 10335.

rownames(accidents) <- accidents[, 1]
accidents <- subset(accidents, select = -1)
nrow(accidents)
View(accidents)

# enter data source here or in readme file: https://www.kaggle.com/zynicide/accidents-


##############
##### e. datatypes
##############

# define the following R datatypes:

# factor - holds categorical variables (columns of data)
# that would be a character or integer
# character - string
# int - no decimal point
# num - general number
# double - has a decimal point
# [atomic] vector - each atom is of the same type
# (such as logical, integer, double, character)
# and is a scaler (has length of one)
# list - elements can differ in data type;
# a single list can hold a variety of objects
# array - one or more vector
# matrix - a special vector. has 2 additional attributes:
# number of rows and number of columns

# which of these are in python?
# what are they called in python?

# what are the data types for each of the objects below?
vec <- 1:10
vec # under values is a vector

c_thing <- c(1:10)
c_thing # also under values; is a vector

lst = list(1:10)
lst # under data; is a list

mtx <- matrix(0, 2, 5)
mtx # matrix -- rows and columns


##############
##### f. creating functions and cleaning data
##############

# create a function which calculates the mode for any given parameter x
# BONUS if you can use the function on both categorical and numerical variables.

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


# then use the function on a column of a dataset here. test the results/output to make sure it worked as expected.

colnames(accidents)
names = colnames(accidents)
for (name in colnames(accidents)) {
  print(name)
}

types = lapply(accidents, class)
types
is.numeric(accidents$Serious.injuries) # numeric
is.factor(accidents$Street) # categorical
is.numeric(accidents$Day)
is.integer(accidents$Hour)

test_hour <- factor(accidents$Hour)
test_hour

Mode(accidents$Street)
Mode(accidents$District.Name)
Mode(accidents$Weekday)
Mode(accidents$Victims)
lapply(accidents, Mode)
lapply(accidents, mean) # won't work because factors in there; we isolate numerics later
hist(accidents$Victims, breaks=15, col="magenta", xlab="no. victims", main="number of victims distribution")
hist(accidents$District.Name, breaks=10, col="magenta", xlab="district name", main="district name distribution") # why won't this work?
hist(accidents$Hour, breaks=10, col="cyan", xlab="hour", main="hour distribution")

pairs(accidents$Victims ~ accidents$District.Name)
pairs(accidents$Victims ~ accidents$Vehicles.involved)
colnames(accidents)
pairs(accidents$District.Name ~ accidents$Weekday + accidents$Month + accidents$Day + accidents$Hour + accidents$Part.of.the.day,
      col=c("red", "orange", "green", "blue", "purple"), labels=c("Target (District)", "Day of Wk", "Month", "Day", "Hour", "Part of Day"))

# by the way, you can export these images

pairs(accidents$Victims ~ accidents$points + accidents$country, col=c("cyan", "magenta"), labels=c("Target (price)", "points", "country"))

sd(accidents$Vehicles.involved)
sd(accidents$Victims)
summary(accidents$Vehicles.involved)
summary(accidents$Victims)
hist(accidents$Vehicles.involved)

# choosing the columns I want
accidents <- subset(accidents, select = c("Victims",
                                          "Neighborhood.Name",
                                          "Weekday",
                                          "Month",
                                          "Day",
                                          "Hour",
                                          "Mild.injuries",
                                          "Serious.injuries",
                                          "Vehicles.involved"))

install.packages("GGally")
library(GGally)
ggpairs(accidents)

# error says I can only pick 15 neighborhoods :(
# I only care about la Vila de Gr√ cia and anything containing l'Eixample

# now filter for only certain neighborhoods
hoods = levels(accidents$Neighborhood.Name)

leixample = "l'Eixample"
gracia = "la Vila de Gr√ cia"
hoods_I_want = c(leixample, gracia)

# how to filter for stuff, like only where Weekday is Monday
accidents %>% filter(Weekday=="Monday")
filter(accidents, Weekday=="Monday") # same thing

View(hoods)

accidents %>% filter(accidents, Neighborhood.Name=="la Vila de Gr√ cia") # why doesn't this work? :(

accidents_encoded <- read.csv("resources/barcelona-data-sets/accidents_2017.csv", encoding = "UTF-8")

# sort(levels(accidents$Neighborhood.Name)) # asserting our grepl function is fool-proof. . .it is
# gracias <- grepl("la Vila de Gr", accidents$Neighborhood.Name)
# sum(grepl("la Vila de Gr", accidents$Neighborhood.Name))
# accidents$Neighborhood.Name[grepl("la Vila de Gr", accidents$Neighborhood.Name)] <- "la Vila de gracia"

# & and | or ! not <> not

accidents_encoded <- distinct(accidents_encoded)

rownames(accidents_encoded) <- accidents_encoded[, 1]

accidents_encoded <- subset(accidents_encoded, select = -1)

names = colnames(accidents_encoded)

types = lapply(accidents_encoded, class)

accidents_encoded <- subset(accidents_encoded, select = c("Victims",
                                          "Neighborhood.Name",
                                          "Weekday",
                                          "Month",
                                          "Day",
                                          "Hour",
                                          "Mild.injuries",
                                          "Serious.injuries",
                                          "Vehicles.involved"))

ggpairs(accidents_encoded)

hoods = levels(accidents_encoded$Neighborhood.Name)

accidents_encoded %>% filter(Weekday=="Monday")
filter(accidents_encoded, Weekday=="Monday") # same thing

accidents_filtered <- accidents_encoded %>% filter(Neighborhood.Name=="la Vila de Gr‡cia" | grepl("l'Eixample", Neighborhood.Name))
View(accidents_filtered)

ggpairs(accidents_filtered) # still an error :( why??

accidents_filtered$Neighborhood.Name <- factor(accidents_filtered$Neighborhood.Name)

ggpairs(accidents_filtered) # WHAT are we looking at guys like what. is. this.


##############
##### g. for loops
##############

# write a for loop that prints each element in a list or vector

for (a in c(1,2,3,4,5)) {
  print(a)
}

for (item in c("this", "is", "a", "loop")) {
  print(item)
}

# write a for loop that takes a list or vector (containing numericals only) and applies some math function to it (ex. squares each element)

for (v in vec) {
  print(v**2)
}

# could also just do vec**2


##############
##### h. functionals
##############

lst = list(1,2,3,4)
vec = c(100, 200, 500, 600)
mtx = matrix(0, 1, 2)

funlala <- function(param) {
  param %% 3
}

# use the above collections and function to use the lapply, sapply, and apply methods:

### lapply
# takes a function and a list. applies the function to each element in the list

lst_results = lapply(lst, function(bruh) { bruh**2 })
lst_results
typeof(lst_results)


### sapply
# does the same thing as lapply but produce an atomic vector
vec_results_sapply = sapply(vec, funlala)
vec_results_sapply
typeof(vec_results_sapply)


### vapply
vec_results_vapply = vapply(vec, funlala, numeric(1)) # vec can actually be vector or list
vec_results_vapply_with_list = vapply(lst, funlala, numeric(1))
# specifying numeric(1) here can be an extra step if you really expect your results to be of some particular type

vec_results_vapply
typeof(vec_results_vapply)
typeof(vec_results_vapply_with_list)

# what is the difference between sapply and vapply?
# --> sapply guesses the output type while vapply will take a parameter to specify the output type
vec_results_sapply
typeof(vec_results_sapply)


### apply
# for matrices. apply(X, MARGIN, FUN)
mtx_results_rows_only = apply(mtx, 1, funlala)
mtx_results_cols_only = apply(mtx, 2, funlala)
mtx_results_rows_and_cols = apply(mtx, c(1,2), funlala)
mtx_results_rows_only
mtx_results_cols_only
mtx_results_rows_and_cols
typeof(mtx_results_rows_and_cols) # also produces atomic vector as output

### maply and tapply also exist but are not commonly used


##############
##### i. installing a library
##############

# install the neuralnet package
install.packages("neuralnet")


##############
##### j. using a library
##############

# 'use' or import the neuralnet package
library(neuralnet)


# how many times do you need to install package? when do you use library(<package>)?


# when do you use the quotes and when do you not?


##############
##### k. handling missing data
##############

# check for missing values in entire dataset
sum(is.na(accidents_filtered))

# check for missing values per column:
missings <- apply(accidents_filtered, 2, function(x) sum(is.na(x)))
missings

# by the way, the above is the same as doing:
fun <- function(x) {sum(is.na(x))}
msgs <- apply(accidents_filtered, 2, fun)
msgs

# check for missing values in a particular column, Vehicles.involved
sum(is.na(accidents_filtered$Vehicles.involved))

View(accidents_filtered)

# how to handle missings depends on a number of factors
# some common ways involve replacing with the mean, median, or mode (depending on dataset, industry, datatypes),
# or simply removing those rows (for larger datasets)
# handling missing values is important because some R packages cannot handle there being missings (although some can)


##############
##### l. handling outliers
##############

# how to obtain outliers
outs <- boxplot(accidents_filtered[, sapply(accidents_filtered, is.numeric)])$out
outs
boxplot(accidents_filtered[, sapply(accidents_filtered, is.numeric)])

# how to replace outliers with the mode (or mean, median)
mild_injury_decoy = accidents_filtered$Mild.injuries
outs <- boxplot(mild_injury_decoy)$out
mild_injury_mode = Mode(accidents$Mild.injuries)
# makes more sense then mean because you don't have 1.4 injuries
mild_injury_outliers_replaced_with_mode <- round(ifelse(accidents_filtered$Mild.injuries%in%outs, mild_injury_mode, accidents_filtered$Mild.injuries), digits=1)
#difference
boxplot(mild_injury_decoy, mild_injury_outliers_replaced_with_mode)


##############
##### m. scale (or "normalize") the data
##############

# first step with neural network is to scale numerical columns to values between 0 and 1
# this is the formula: (x - min(x)) / (max(x) - min(x))
# this means you need min and max per (numerical) variable. in other words, you need to apply min and max functions.
# minx <- min(x) but on all the variables (apply functional)

# use an apply method to normalize the numerical data

# first it may help to use an sapply and is.numeric and is.factor to parse numerical and categorical variables
NUM <- accidents_filtered[, sapply(accidents_filtered, is.numeric)]
FAC <- accidents_filtered[, sapply(accidents_filtered, is.factor)]

# formula for setting numerical data to values between 0 and 1 : (x - min(x)) / (max(x) - min(x))
# there's a function for it called scale, but you need mins and maxes first
# since there are multiple, can use apply function

mins <- apply(NUM, 2, min)
mins
maxs <- apply(NUM, 2, max)
maxs

# then can use scale function
NUM_scaled <- as.data.frame(scale(NUM, center = mins, scale = (maxs - mins)))
summary(NUM_scaled) #everything is between 0 and 1

# can use the dummy library to convert the categorical variables
install.packages("dummy")
library(dummy)
FAC_dummy <- dummy(FAC, int = TRUE)
FAC_dummy

#then re-bind the data into a single dataframe
accidents_filtered <- cbind(NUM_scaled, FAC_dummy)
head(accidents_filtered)


##############
##### n. dividing data into test/train set
##############

# divide your data into 2 parts. 1 part test, and one part training, with a 67%/33% split
# HINT: use the sample function
# make sure to set the seed
set.seed(123)
idx <- sample(2, nrow(accidents_filtered), replace = T, prob=c(0.67, 0.33))
scaled_train <- accidents_filtered[idx == 1, ]
scaled_test <- accidents_filtered[idx == 2, ]
inputs <- names(accidents_filtered)
frml <- as.formula(paste("Victims ~", paste(inputs, collapse = "+")))


##############
##### n. build a neural network model
##############

# https://cran.r-project.org/web/packages/neuralnet/neuralnet.pdf
?neuralnet

# create a neural network with 5 hidden neurons in a single input layer
nn_5_neurons_1_hidden_layer <- neuralnet(frml, data = scaled_train, hidden = 5)

# create another model with 2 hidden layers, the first with 3 neurons and the second layer with 2, we could have done hidden = c(3,2).
nn_5_neurons_2_hidden_layers <- neuralnet(frml, data = scaled_train, hidden = c(3,2), linear.output = T)

# what does linear.output = T mean?

# plot the neural networks
plot(nn_5_neurons_1_hidden_layer)
plot(nn_5_neurons_2_hidden_layers)
