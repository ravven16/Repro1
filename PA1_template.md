---
title: "PeerAssesment"
author: "Ravi Venkatesh"
date: "Sunday, April 19, 2015"
output: html_document
keep_md: true
---


<!-- rmarkdown v1 -->



This document is created for assignment 1.This assignment makes use of data from a personal activity monitoring device. This device collects data at 5 minute intervals through out the day. The data consists of two months of data from an anonymous individual collected during the months of October and November, 2012 and include the number of steps taken in 5 minute intervals each day.

Based on the data provided the below analysis are performed using R for the questions given in the assignment.

The file is downloaded from net and it is stored in the working directory. So the current directory is made as working directory.


```r
setwd("C:/Users/SHRIThanuja/Desktop/courserEraR/Reproducible Research/rprog_data_specdata")
```

## Loading and preprocessing the data

The csv file is read and loaded into a data.table called activity_file


```r
require("data.table")
```

```
## Loading required package: data.table
```

```
## Warning: package 'data.table' was built under R version 3.1.3
```

```r
activity_file <- data.table(read.csv("activity.csv"))
```

The column steps have invalid values 'NA', though it may cause issues, there are functions which can exclude this values for computation. So no modification is required as of now.

##What is mean total number of steps taken per day?

###Calculate the total number of steps taken per day

The steps taken per day can be computed by using the aggregate function and it is loaded into a dataframe steps_taken_day.


```r
steps_taken_day <- aggregate(steps ~ date, data=activity_file, FUN=sum)
head(steps_taken_day)
```

```
##         date steps
## 1 2012-10-02   126
## 2 2012-10-03 11352
## 3 2012-10-04 12116
## 4 2012-10-05 13294
## 5 2012-10-06 15420
## 6 2012-10-07 11015
```

###

If you do not understand the difference between a histogram and a barplot, research the difference between them. Make a histogram of the total number of steps taken each day


```r
steps_taken_day$date <- as.factor(steps_taken_day$date)
hist( x = steps_taken_day$steps,
main = "Total steps taken each day", # title of the plot
xlab = "Number of Steps", # set the x-axis label
labels = TRUE, # add frequency labels to each bar
ylab = "Frequency" # change the scale of the y-axis
 )
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4-1.png) 

Histogram will present the number of observation for a particular frequency and it only take numeric value in x axis.The barplot clearly plot the number of steps/day based on date. 


```r
barplot(height = steps_taken_day$steps,
names.arg = steps_taken_day$date,
 las = 3 # rotate the labels
 )
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5-1.png) 

### Calculate and report the mean and median of the total number of steps taken per day

The mean and median of steps are given below


```r
mean(steps_taken_day$steps,na.rm = TRUE)
```

```
## [1] 10766.19
```

```r
median(steps_taken_day$steps,na.rm = TRUE)
```

```
## [1] 10765
```

## What is the average daily activity pattern?

### Make a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

The average steps taken per interval can be calculated using the aggregate function


```r
avg_steps_interval <- aggregate(steps ~ interval, data=activity_file, FUN=mean)
head(avg_steps_interval)
```

```
##   interval     steps
## 1        0 1.7169811
## 2        5 0.3396226
## 3       10 0.1320755
## 4       15 0.1509434
## 5       20 0.0754717
## 6       25 2.0943396
```

```r
plot(avg_steps_interval,type='l')
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7-1.png) 

###Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

```r
avg_steps_interval$interval[which.max(avg_steps_interval$steps)]
```

```
## [1] 835
```

## Imputing missing values

### Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with NAs)


```r
length(which(is.na(activity_file$steps)))
```

```
## [1] 2304
```

### Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc.

As some of the dates doesnt have any valid value, it was deceided to use mean for 5 minute interval for populating the NA's

### Create a new dataset that is equal to the original dataset but with the missing data filled in



```r
avg_steps_interval <- data.table(avg_steps_interval)
avg_steps_interval[,charinterval := as.character(avg_steps_interval$interval)]
```

```
##      interval     steps charinterval
##   1:        0 1.7169811            0
##   2:        5 0.3396226            5
##   3:       10 0.1320755           10
##   4:       15 0.1509434           15
##   5:       20 0.0754717           20
##  ---                                
## 284:     2335 4.6981132         2335
## 285:     2340 3.3018868         2340
## 286:     2345 0.6415094         2345
## 287:     2350 0.2264151         2350
## 288:     2355 1.0754717         2355
```

```r
setkey(avg_steps_interval,charinterval)

computemean <- function(x){x1 <- as.character(x)
y <- avg_steps_interval[x1,]
y$steps
}

activity_mod <- data.table(copy(activity_file))
activity_mod[,meanperinterval := computemean(activity_mod$interval)]
```

```
##        steps       date interval meanperinterval
##     1:    NA 2012-10-01        0       1.7169811
##     2:    NA 2012-10-01        5       0.3396226
##     3:    NA 2012-10-01       10       0.1320755
##     4:    NA 2012-10-01       15       0.1509434
##     5:    NA 2012-10-01       20       0.0754717
##    ---                                          
## 17564:    NA 2012-11-30     2335       4.6981132
## 17565:    NA 2012-11-30     2340       3.3018868
## 17566:    NA 2012-11-30     2345       0.6415094
## 17567:    NA 2012-11-30     2350       0.2264151
## 17568:    NA 2012-11-30     2355       1.0754717
```

```r
activity_mod$steps[is.na(activity_mod$steps)] <- activity_mod$meanperinterval[is.na(activity_mod$steps)]
activity_mod$meanperinterval <- NULL
head(activity_mod)
```

```
##        steps       date interval
## 1: 1.7169811 2012-10-01        0
## 2: 0.3396226 2012-10-01        5
## 3: 0.1320755 2012-10-01       10
## 4: 0.1509434 2012-10-01       15
## 5: 0.0754717 2012-10-01       20
## 6: 2.0943396 2012-10-01       25
```


### Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?


```r
steps_taken_day_mod <- aggregate(steps ~ date, data=activity_mod, FUN=sum)
head(steps_taken_day_mod)
```

```
##         date    steps
## 1 2012-10-01 10766.19
## 2 2012-10-02   126.00
## 3 2012-10-03 11352.00
## 4 2012-10-04 12116.00
## 5 2012-10-05 13294.00
## 6 2012-10-06 15420.00
```


```r
hist( x = steps_taken_day_mod$steps,
main = "Total steps taken each day", # title of the plot
xlab = "Number of Steps", # set the x-axis label
labels = TRUE, # add frequency labels to each bar
ylab = "Frequency" # change the scale of the y-axis
 )
```

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12-1.png) 


```r
barplot(height = steps_taken_day_mod$steps,
names.arg = steps_taken_day_mod$date,
 las = 3 # rotate the labels
 )
```

![plot of chunk unnamed-chunk-13](figure/unnamed-chunk-13-1.png) 


```r
mean(steps_taken_day_mod$steps,na.rm = TRUE)
```

```
## [1] 10766.19
```

```r
median(steps_taken_day_mod$steps,na.rm = TRUE)
```

```
## [1] 10766.19
```

There was no significant differences in mean calculated before and after adding NA's.

## Are there differences in activity patterns between weekdays and weekends?

### Create a new factor variable in the dataset with two levels - "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.



```r
isweekend <- function(date) {
    if (weekdays(as.Date(date)) %in% c("Saturday", "Sunday")) {
        "weekend"
    } else {
        "weekday"
    }
}
activity_file$weektype <- as.factor(sapply(activity_file$date, isweekend))

activity_file
```

```
##        steps       date interval weektype
##     1:    NA 2012-10-01        0  weekday
##     2:    NA 2012-10-01        5  weekday
##     3:    NA 2012-10-01       10  weekday
##     4:    NA 2012-10-01       15  weekday
##     5:    NA 2012-10-01       20  weekday
##    ---                                   
## 17564:    NA 2012-11-30     2335  weekday
## 17565:    NA 2012-11-30     2340  weekday
## 17566:    NA 2012-11-30     2345  weekday
## 17567:    NA 2012-11-30     2350  weekday
## 17568:    NA 2012-11-30     2355  weekday
```


##    Make a panel plot containing a time series plot (i.e. type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis).


```r
par(mfrow = c(2, 1))
for (type in c("weekend", "weekday")) {
    steps.type <- aggregate(steps ~ interval, data = activity_file, subset = activity_file$weektype == 
        type, FUN = mean)
    plot(steps.type, type = "l", main = type)
}
```

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16-1.png) 
