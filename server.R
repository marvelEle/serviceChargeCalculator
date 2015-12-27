serviceCharge <- function(scharge,spend) spend * (scharge / 100)
totalWithServiceCharge <- function(currTotal,sc) currTotal + sc

library(shiny)
shinyServer(
  function(input, output) {
    values <- reactiveValues()
    
    observe({
      values$total_service_charge <- serviceCharge(input$sc,input$spending) 
      values$total_with_serivce_charge <- totalWithServiceCharge(input$spending,values$total_service_charge)
      
      })
    
    
    output$total_spend <- renderPrint({input$spending})
    output$percent_charge <- renderPrint({input$sc})
    
    
    
    output$service_charge <- renderPrint({values$total_service_charge})
    output$pay <- renderPrint({values$total_with_serivce_charge})
  }
)