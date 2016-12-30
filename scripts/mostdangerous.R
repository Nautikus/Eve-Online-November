library(plotly)

mydata <- RegionalStats[order(RegionalStats$proddestavg),]
#mydata <- by(mydata,mydata["proddestavg"],head, n = 10)
mydata <- mydata[1:20,]

mydata


m <- list(
  l = 150,
  r = 50,
  b = 100,
  t = 100,
  pad = 2
)

xstyle <- list(
  family = "Calibri, monospace",
  size = 10,
  color = "grey"
)

ystyle <- list(
  family = "Calibri, monospace",
  size = 10,
  color = "grey"
)

p <- plot_ly(
  y = mydata$regionName,
  x = mydata$proddestavg,
  name = "Stats",
  type = "bar"
) %>%

  layout(
    title="Top 20 Regions Where ISK production is close to 0 vs ISK Destroyed", margin = m,
    xaxis = list(
      title = "Closer to 0 means more turmoil",
      tickfont  = xstyle
    ),
    yaxis = list(
      tickfont = ystyle,
      categoryarray = mydata$proddestavg,
      categoryorder = "array"
    )
  )
p

