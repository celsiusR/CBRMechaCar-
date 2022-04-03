
#Deliverable 1
# use the dplyr library
library(dplyr)

# Importing the csv file
mechaCar_mpg_DF <- read.csv(file='Resources/MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)

head(mechaCar_mpg_DF)

# Perform linear regression
lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mechaCar_mpg_DF)
# Using the summary function, find the p-value and r-squared
summary(lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mechaCar_mpg_DF))

# Deliverable 2

# Supension Coil Lot Analysis
# read csv to dataframe
suspension_coil_DF <- read.csv(file = 'Resources/Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
head(suspension_coil_DF)
# create a summary dataframe
total_summary_DF <- suspension_coil_DF %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))


print(total_summary_DF)


# create summaries for each lot
lot_summary_DF <- suspension_coil_DF %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
print(lot_summary_DF)

# Deliverable 3

# T-tests on Suspension Soils
t.test(suspension_coil_DF$PSI, mu=1500)

t.test(subset(suspension_coil_DF,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(suspension_coil_DF,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(suspension_coil_DF,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)


