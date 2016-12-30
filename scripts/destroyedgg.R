library(ggplot2)
library(reshape2)

options("scipen"=999, "digits"=4)

RegionalStats <- read.csv("data/RegionalStats.csv")
regionName <- RegionalStats$regionName
totalProd <- RegionalStats$total.production
totalDest <- RegionalStats$total.destroyed

totalDest <- totalDest*0.000000000001
totalProd <- totalProd*0.000000000001

df <- data.frame(regionName, totalProd, totalDest)

mm <- melt(df[,c('regionName','totalDest','totalProd')], id.vars=1)
mm
ggplot(data=mm, aes(x=regionName, y=value)) +
  geom_bar(stat="identity", position="dodge",aes(fill = variable)) +
  coord_flip() +
  theme(axis.line = element_line(color = "black", size=1, linetype="solid")) +
  labs(title = "ISK Destroyed vs Produced", y="ISK (Trillions)", x="Region") +
  scale_y_continuous(expand = c(0,0), limits = c(0,30)) +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_discrete(breaks=c('totalDest', 'totalProd'),
                      labels=c("Total Destroyed", "Total Produced"))


