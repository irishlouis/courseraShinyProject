library(shiny)
library(dplyr)
library(lubridate)
library(xts)
library(dygraphs)
library(TTR)

shinyServer(function(input, output, session) {
 
  message("getting data")
  dates <- reactive({ymd(row.names(as.data.frame(getYahooData(input$stock1, 
                                                              start = format(today() - days(input$n.days), "%Y%m%d"), 
                                                              end = format(today() - days(1), "%Y%m%d")))))
                     })
  
  df1 <- reactive({cbind(Date = dates(), as.data.frame(getYahooData(input$stock1, 
                                                                    start = format(today() - days(input$n.days), "%Y%m%d"), 
                                                                    end = format(today() - days(1), "%Y%m%d"))) %>% 
                     mutate(stock = input$stock1) %>% 
                     select(stock, Close, Volume))
                  })
  df2 <- reactive({cbind(Date = dates(), as.data.frame(getYahooData(input$stock2, 
                                                                    start = format(today() - days(input$n.days), "%Y%m%d"), 
                                                                    end = format(today() - days(1), "%Y%m%d"))) %>% 
                           mutate(stock = input$stock2) %>% 
                           select(stock, Close, Volume))
                  })
    
  df <- reactive({list(df1(), df2())})
  
  output$head1 <- renderPrint({100*round(df1()[nrow(df1()), 3] / df1()[1, 3] - 1, 2)})
  output$head2 <- renderPrint({100*round(df2()[nrow(df2()), 3] / df2()[1, 3] - 1, 2)})
  output$head3 <- renderPrint({ tmp1 <- round(df1()[nrow(df1()), 3] / df1()[1, 3] , 2)
                                tmp2 <- round(df2()[nrow(df2()), 3] / df2()[1, 3] , 2)
                                return(100 * ifelse(tmp1 > tmp2, 
                                       round(tmp1/tmp2, 2) - 1,
                                       round(tmp2/tmp1, 2) - 1
                                       )
                                  )
                                })
    
  stock.xts <- reactive({
    stocks <- NULL
    for(i in 1:2){
      stocks <- cbind(stocks, xts(df()[[i]]$Close, order.by = df()[[i]]$Date, frequency = 365))
    }
    names(stocks) <- c(input$stock1, input$stock2)
    stocks
  })
    
  output$plot1 <- renderDygraph({
    dygraph(stock.xts(), ylab="Close", 
            main="Hover on line for Closing Price") %>%
      dyRangeSelector()
    
  })
  
})



