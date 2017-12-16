#! /usr/bin/env Rscript 
# clean_data.R
# Stephanie Xu, Dec 2016
#
# This script clean data from a .csv file. 
# It will delete the NA for specific columns.
# This script takes a filename and column names as the variable argument.
#
# Usage: Rscript clean_data.R titanic.csv survived age fare

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]  # path for the original data
cleaned_data <- args[2]  # path for the cleaned data
library(tidyverse)

# define main function
main <- function(){
  
  # read in data
  data <- read.csv(input_file,header=TRUE)
  
  # clean data
  data1 <- data%>%
    filter(is.na(survived)==FALSE,is.na(age)==FALSE,is.na(fare)==FALSE)
  
  # write clean data to new csv file
  write.csv(data1,cleaned_data,row.names = FALSE)
}


# call main function
main()