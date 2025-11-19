if (!require('tidyverse')) install.packages('tidyverse'); library('tidyverse')
if (!require('janitor')) install.packages('janitor'); library('janitor')
if (!require('writexl')) install.packages('writexl'); library('writexl')
if (!require('stringi')) install.packages('stringi'); library('stringi')
if (!require('fuzzyjoin')) install.packages('fuzzyjoin'); library('fuzzyjoin')
if (!require('sf')) install.packages('sf'); library('sf')
if (!require('tools')) install.packages('tools'); library('tools')
if (!require('Metrics')) install.packages('Metrics'); library('Metrics')
if (!require('PRROC')) install.packages('PRROC'); library('PRROC')
if (!require('caret')) install.packages('caret'); library('caret')
library(stringr)
install.packages("caret")
install.packages("Metrics")
library(ggplot2)



##Mann Whitney U test_je isto sto i Wilcoxsonova suma rangova

##Mydata 
setwd(dirname(file.choose()))

##Algoritmi (algoritmi)##
export_algoritmi <- read_csv(file = file.choose())
# View the first few rows of the data to understand its structure
head(export_algoritmi)


#name variables
group <- export_algoritmi$Algorithm
outcome <- export_algoritmi$Match

# Perform Mann-Whitney U Test
results_Algorithm <- wilcox.test(outcome ~ group, data = export_algoritmi, exact = FALSE)

# OR check the W statistic and p-value directly
cat("\nTest Statistic (W): ", results_Algorithm$statistic, "\n")
cat("P-value: ", results_Algorithm$p.value, "\n")


## Manual vs MiewID expert (MM)##

export_MM <- read_csv(file = file.choose())
# View the first few rows of the data to understand its structure
head(export_MM)


#name variables
group <- export_MM$Group
outcome <- export_MM$Outcome

# Perform Mann-Whitney U Test
results_WhiskerManual_IDevents <- wilcox.test(outcome ~ group, data = export_MM, exact = FALSE)

# OR check the W statistic and p-value directly
cat("\nTest Statistic (W): ", results_WhiskerManual_IDevents$statistic, "\n")
cat("P-value: ", results_WhiskerManual_IDevents$p.value, "\n")


## Expert_novice (EN)##

export_EN <- read_csv(file = file.choose())
# View the first few rows of the data to understand its structure
head(export_EN)


#name variables
group <- export_EN$Group
outcome <- export_EN$Ided

# Perform Mann-Whitney U Test
results_Expert_Novice <- wilcox.test(outcome ~ group, data = export_EN, exact = FALSE)

# OR check the W statistic and p-value directly
cat("\nTest Statistic (W): ", results_Expert_Novice$statistic, "\n")
cat("P-value: ", results_Expert_Novice$p.value, "\n")
