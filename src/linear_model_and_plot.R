#! /usr/bin/env Rscript 
# linear_model_and_plot.R
# Stephanie Xu, Dec 2016
#
# This script can fit linear model and plot it based on data from a .csv file. 
#
# Usage: Rscript linear_model_and_plot.R titanic_clean.csv

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
library(tidyverse)
library(ggplot2)
library(svglite)

# define main function
main <- function(){
  
  # read in data
  data1 <- read.csv(input_file,header=TRUE)
  
  # fit linear model between age and survived rate.
  lm1 <- lm(data = data1, survived~age)
  summary(lm1)
  
  #take results to a table
  test1 <- broom::tidy(summary(lm1))
  write.csv(test1,file="./results/age_survived.csv")
  
  #draw a boxplot and save it to plot1.png
  plot1 <- ggplot(data1, aes(factor(survived),age))+
    geom_boxplot(aes(group=survived))+
    labs(x="survived", y="age",title="Boxplot for survived and age")
  ggsave("./results/age_survived.svg",plot1,scale=0.8)
  
  # fit linear model between fare and survived rate.
  lm2 <- lm(data = data1, survived~fare)
  summary(lm2)
  
  #take results to a table
  test2 <- broom::tidy(summary(lm2))
  write.csv(test2,file="./results/fare_survived.csv")
  
  
  # draw a boxplot and save it to plot2.png
  plot2 <- ggplot(data1, aes(factor(survived),fare))+
    geom_boxplot(aes(group=survived))+
    labs(x="survived", y="fare",title="Boxplot for survived and fare")
  ggsave("./results/fare_survived.svg",plot2,scale=0.8)
  
 }


# call main function
main()