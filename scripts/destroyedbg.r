library(plotly)



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
    y = RegionalStats$regionName,
    x = RegionalStats$total.destroyed,
    name = "Stats",
    type = "bar"
  ) %>%
  
  layout(
    title="ISK Destroyed by Region", margin = m,
    xaxis = list(
      title = "ISK (T)",
      tickfont  = xstyle
      ),
    yaxis = list(
      tickfont = ystyle
      )
    )
p

