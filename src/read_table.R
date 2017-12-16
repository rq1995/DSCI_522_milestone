#! /usr/bin/env Rscript
#read_table.R
#Stephanie Xu, Dec 2017
#
#This script read the titanic table from github, 
#and then write a csv file to this repo.
#
#Usage: Rscript read_table.R
#Output: data file

#read data from github link
titanic=read.csv("https://raw.github.ubc.ca/ubc-mds-2017/datasets/master/data/titanic.csv?token=AAADqC0ANzUKk2ZCPXF4Sb13ucDojAHxks5aNpHbwA%3D%3D", header=TRUE)

#show the first 6 line from titanic table
head(titanic)
str(titanic)

#write csv file to data folder
write.csv(titanic,file="./data/titanic.csv")

