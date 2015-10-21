---
title       : Shiny Project
subtitle    : Instructions for use for app
author      : Louis Smith
job         : Coursera
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## Overview of App

The purpose of this app is to allow a user to investigate the overall & relative performance of two NASDAQ listed stocks over a user specifed period of time.

Users can see:

1. interactive time series plot of stock closing price
2. the % change in closing price over the selected period for both stocks
3. the relative performance of the better performing stock over the weaker

--- .class #id 

## Inputs
The user selects two stocks (default selection is Google "GOOG" and Apple "AAPL") via drop down menu.

The user next selects the number of days to look back over (default selection is 365 days) via a slider bar.

## Ouputs
The app will display the time series plot of the daily stock closing prices for the selected stocks.

Also displayed is the independant % increase / decrease in closing price for both stocks over the period. As well as the relative performance of the better performing stock over the weaker.

The plot is a dygraph - hoovering over the line will display the closing price for both stocks for that date.

If required the use can also zoom in using the bar on the bottom.
*NOTE: the zoom function on the dygrph is for visual inspection - and is not reactive*

--- .class #id 

## Package Dependancies
A number of packages are used in the implementation of this app:

* TTR
* dygraph
* dplyr
* lubridate
* xts

--- .class #id 

## Links
[github link](https://github.com/irishlouis/courseraShinyProject)

[shiny app io link](https://irishlouissmith.shinyapps.io/courseraShinyAppProject)






Date of publication

```r
require(lubridate)
```

```
## Loading required package: lubridate
```

```r
today()
```

```
## [1] "2015-10-21"
```

---

