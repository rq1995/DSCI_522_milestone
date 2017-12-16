# Driver script
# Ruoqi Xu, Dec 2017
# Completes analysis of the effect of survival rates from age and fare (from raw data to rendering report)
#
# Usage:
# make all
# make clean

# run all analysis
all: doc/report.md

# download data
data/titanic.csv: src/read_table.R
	Rscript src/read_table.R

# clean data
results/clean_titanic.csv: data/titanic.csv src/clean_data.R
	Rscript src/clean_data.R data/titanic.csv results/clean_titanic.csv

# create linear model and plots
results/age_survived.csv results/figure/age_survived.svg results/fare_survived.csv results/figure/fare_survived.svg: results/clean_titanic.csv src/linear_model_and_plot.R
	Rscript src/linear_model_and_plot.R results/clean_titanic.csv

# create final report
doc/report.md: src/Analysis_report.Rmd results/age_survived.csv results/figure/age_survived.svg results/fare_survived.csv results/figure/fare_survived.svg
	Rscript -e "ezknitr::ezknit('src/Analysis_report.Rmd', out_dir = 'doc')"

# delete intermediate files
clean:
	rm -f results/age_survived.csv
	rm -f results/figure/age_survived.svg
	rm -f results/fare_survived.csv
	rm -f results/figure/fare_survived.svg
	rm -f results/clean_titanic.csv
	rm -f doc/Analysis_report.md doc/Analysis_report.html
