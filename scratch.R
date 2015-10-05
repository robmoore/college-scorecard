# https://collegescorecard.ed.gov/data/

# Indicates that HS median income is actually higher:
# http://www.pewsocialtrends.org/2014/02/11/the-rising-cost-of-not-going-to-college/
# https://nces.ed.gov/fastfacts/display.asp?id=77

#data <- read.csv("Most+Recent+Cohorts+(All+Data+Elements).csv", na.strings = c("NULL", "PrivacySuppressed"))
data <- read.csv("https://s3.amazonaws.com/ed-college-choice-public/Most+Recent+Cohorts+(Treasury+Elements).csv", na.strings = c("NULL", "PrivacySuppressed"))
data$gt_25k_p10_b <- data$gt_25k_p10 > .5 # Turn into boolean value
data$COSTT4 <- with(data,ifelse(is.na(COSTT4_A),COSTT4_P,COSTT4_A)) # select column with non-NA value
cdata <- data[,c("COSTT4", "gt_25k_p10_b")]
cdata <- cdata[complete.cases(cdata),] # drop NA rows
barplot(table(cdata$gt_25k_p10_b), xlab="Majority of Graduates Exceed HS Median Income", ylab="Average Cost of Attendance (Tuition and Fees) in $")
hist(cdata$COSTT4, xlab="Cost in $", main ="Average Cost of Attendance")