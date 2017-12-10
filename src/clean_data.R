#! /usr/bin/env Rscript 
# clean_data.R
# Stephanie Xu, Dec 2016
#
# This script clean data from a .csv file. 
# It will delete the NA for specific columns.
# This script takes a filename and column names as the variable argument.
#
# Usage: Rscript clean_data.R titanic.csv survived

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
variable <- args[2]
library(tidyverse)

# define main function
main <- function(){
  
  # read in data
  data <- read.csv(input_file,header=TRUE)
  
  # clean data
  data <- data%>%
    filter(is.na(variable)==FALSE)
  
  # write clean data to new csv file
  write.csv(data,file="/Users/apple/Documents/777/UBC/block3/DSCI_522/DSCI_522_milestone/data/titanic_clean.csv")
}


# call main function
main()