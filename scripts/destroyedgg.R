library(ggplot2)

regionName <- c(RegionalStats$regionName)
totalDest <- c(RegionalStats$total.destroyed)

df <- data.frame(regionName, totalDest)

df

ggplot(data=df, aes(x=regionName, y=totalDest)) + geom_bar(fill="purple3", stat="identity", linetype=2) + 
  scale_fill_hue () + 
  coord_flip() +
  theme(axis.line = element_line(color = "black", size=1, linetype="solid")) +
  labs(title = "Total ISK Destroyed by Region", y="ISK", x="Region") +
  scale_y_continuous(limits=c(0,3500000000000))



