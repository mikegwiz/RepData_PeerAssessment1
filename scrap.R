
rawdata <- read.csv("activity.csv")
str(rawdata)

#change date column to date format
data <- rawdata
data$date <- as.Date(data$date, format= c("%Y-%m-%d"))
data$interval


#Mean number of steps per day
library(dplyr)
dfsumsteps <- data %>%
        select(date, steps) %>%
        group_by(date) %>%
        summarise(totsteps= sum(steps))
head(dfsumsteps,10)
summary(dfsumsteps)
hist(dfsumsteps$totsteps, main="Histogram of the Total Number of Steps Taken Each Day",
     xlab="Number of Steps per Day", ylab="Number of Days",ylim=c(0,30), col="lightgreen")

mean(dfsumsteps$totsteps,na.rm=TRUE)
median(dfsumsteps$totsteps, na.rm=TRUE)
