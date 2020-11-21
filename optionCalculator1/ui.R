#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Option Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        helpText("This calculator computes European call and put option prices using your inputs."),
        br(),
        selectInput('type', label = h6('Select option type'), choices = list('Call'=1, 'Put'=-1), selected = 1),
        br(),
        numericInput("p", label = h6('Enter stock price in $'), value = 40),
        br(),
        numericInput('k', label = h6('Enter strike price ($)'), value = 40),
        br(),
        numericInput('sigma', label = h6('Enter volatility (% per year)'), value = 20),
        br(),
        numericInput('r', label = h6('Enter risk-free interest rate (%)'), value = 1),
        br(),
        numericInput('t', h6('Enter time to expiration (in years)'), value = .5),
        br(),
        
        actionButton('Calc', label = 'Calculate')
 

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
           tabPanel('Result',
                    p(h3('You entered:')),
                    textOutput('textType'),
                    textOutput('textPrice'),
                    textOutput('textStrike'),
                    textOutput('textRate'),
                    textOutput('textTime'),
                    textOutput('textVol'),
                    br(),
                    
                    p(h3('Results:')),
                    textOutput('textOptionPrice'),
                    textOutput('textDelta'),
                    textOutput('textVega')
     
                    ),
           tabPanel('Documentation',
                    p(h4('Option Calulator')),
                    br(),
                    helpText('This calculator compute option prices (call and put options) using the Black-Scholes formula. 
                             It also calculates Delta and Vega for hedging purposes.')
                    )
        )

    )
  )
))
