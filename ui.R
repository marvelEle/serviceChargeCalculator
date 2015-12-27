library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Service Charge Calculator"),
  sidebarPanel(
    p('This app calculate service tax that will charge from your consumption amount.'),
    numericInput('spending', 'How much did you spend here? ($)', 0, min = 0, max = NA, step = 1),
    sliderInput('sc', 'Service Charge by percentage (%)',value = 0, min = 0, max = 100),
    
    submitButton('Submit')
  ),
  mainPanel(
    tabsetPanel(
      tabPanel('Output',
               h3('Value you entered'),
               h4('Total Spend:'),
               verbatimTextOutput("total_spend"),
               h4('Service Charge (%):'),
               verbatimTextOutput("percent_charge"),
               h4('Service Charge ($):'),
               verbatimTextOutput("service_charge"),
               h4('Total spend include service charge:'),
               verbatimTextOutput("pay")
      ),
      tabPanel('Documentation',
               p(h4("Service Charge Calculator:")),
               br(),
               helpText("This application calculates service charge being charge to consumer when they dine-in at any restaurant."),
               HTML("<u><b>Equation for calculation: </b></u>
                    <br> <br>
                    <b> T = S + ( S * (SC / 100)) </b>
                    <br>
                    where: <br>
                    T = Total Amount <br>
                    S = Spending Amount <br>
                    SC = Service charge in percent <br>
                    ")               
      )
    )
    
    
  )
))