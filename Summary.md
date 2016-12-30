Summary Statistics for Eve Online in November
================

Introduction
------------

Below we will use summary statistics to try and recreate some of the information shown in the Power BI Pictures folder. Datasets have been provided by CCP Quant located at <https://community.eveonline.com/news/dev-blogs/monthly-economic-report-november-2016/>

To roughly convert the ISK to USD, 1 billion ISK = $15 USD (Price of PLEX)

### Graphs and Code

First we will need to include the ggplot2 library

``` r
library(ggplot2)
library(reshape2)
```

#### Total ISK Destroyed by Region

``` r
options("scipen"=999, "digits"=4) #stops R from using Scientific Notation when viewing ISK

regionalStats <- read.csv("data/RegionalStats.csv") #Import the data from the csv
regionName <- regionalStats$regionName
totalDest <- c(regionalStats$total.destroyed)

totalDest <- totalDest*0.000000000001 #Brings the ISK value to more viewable number (in the Trillions)

df <- data.frame(regionName, totalDest) #Creates a dataframe for use in ggplot

ggplot(data=df, aes(x=regionName, y=totalDest)) + geom_bar(fill="red3", stat="identity", linetype=2) + 
  scale_fill_hue () + 
  coord_flip() +
  theme(axis.line = element_line(color = "black", size=1, linetype="solid")) +
  labs(title = "Total ISK Destroyed by Region", y="ISK (Trillions)", x="Region") +
  scale_y_continuous(expand = c(0,0), limits = c(0,3.5))
```

![](Summary_files/figure-markdown_github/RegionalDest-1.png)

#### Total ISK Produced by Region

``` r
options("scipen"=999, "digits"=4) #stops R from using Scientific Notation when viewing ISK

regionalStats <- read.csv("data/RegionalStats.csv") #Import the data from the csv
regionName <- regionalStats$regionName
totalProd <- c(regionalStats$total.production)

totalProd <- totalProd*0.000000000001 #Brings the ISK value to more viewable number (in the Trillions)

df <- data.frame(regionName, totalProd) #Creates a dataframe for use in ggplot

ggplot(data=df, aes(x=regionName, y=totalProd)) + geom_bar(fill="blue3", stat="identity", linetype=2) + 
  scale_fill_hue () + 
  coord_flip() +
  theme(axis.line = element_line(color = "black", size=1, linetype="solid")) +
  labs(title = "Total ISK Produced by Region", y="ISK (Trillions)", x="Region") +
  scale_y_continuous(expand = c(0,0), limits = c(0,30))
```

![](Summary_files/figure-markdown_github/RegionalProd-1.png)

#### Total ISK Produced vs Total ISK Destroyed

``` r
options("scipen"=999, "digits"=4)

regionalStats <- read.csv("data/RegionalStats.csv")
regionName <- regionalStats$regionName
totalProd <- regionalStats$total.production
totalDest <- regionalStats$total.destroyed

totalDest <- totalDest*0.000000000001
totalProd <- totalProd*0.000000000001

df <- data.frame(regionName, totalProd, totalDest)
mm <- melt(df[,c('regionName','totalDest','totalProd')], id.vars=1) #Melts the dataframe so we can use it to create a clustered bar chart

ggplot(data=mm, aes(x=regionName, y=value)) +
  geom_bar(stat="identity", position="dodge",aes(fill = variable)) +
  coord_flip() +
  theme(axis.line = element_line(color = "black", size=1, linetype="solid")) +
  labs(title = "ISK Destroyed vs Produced", y="ISK (Trillions)", x="Region") +
  scale_y_continuous(expand = c(0,0), limits = c(0,30)) +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_discrete(breaks=c('totalDest', 'totalProd'),
                      labels=c("Total Destroyed", "Total Produced"))
```

![](Summary_files/figure-markdown_github/RegionalComparison-1.png)
