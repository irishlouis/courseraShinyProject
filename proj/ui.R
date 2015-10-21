library(shiny)
library(TTR)
library(dygraphs)

names <- stockSymbols(exchange = "NASDAQ")$Symbol

shinyUI(pageWithSidebar(
  
  headerPanel('NASDAQ - Stock Closing Prices Comparator'),
  sidebarPanel(
    
    selectInput(inputId = 'stock1', label = 'Stock 1', choices = names, selected = "GOOG"),
    selectInput(inputId = 'stock2', label = 'Stock 2', choices = names, selected = "AAPL"),
     sliderInput('n.days', 'Number of days', 365,
              min = 7, max = 1000)
  ),
  mainPanel(
    dygraphOutput("plot1"),
    p(),
    p('Change (%) in Closing Price for Stock 1'),
    verbatimTextOutput("head1"),
    ('Change (%) in Closing Price for Stock 2'),
    verbatimTextOutput("head2") ,
    ('Relative Performance (%)'),
    verbatimTextOutput("head3")
  )
))

