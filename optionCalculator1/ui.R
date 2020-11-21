
library(shiny)

# Define UI for application that computes option price
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Financial Option Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        helpText("This calculator computes European call and put option prices using your inputs."),
        br(),
        selectInput('type', label = h6('Select option type'), choices = list('Call'=1, 'Put'=-1), selected = 1),
        br(),
        numericInput("p", label = h6('Enter stock price ($)'), value = 40),
        br(),
        numericInput('k', label = h6('Enter strike price ($)'), value = 40),
        br(),
        numericInput('sigma', label = h6('Enter stock volatility (% per year)'), value = 20),
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
                    textOutput('textVol'),
                    textOutput('textRate'),
                    textOutput('textTime'),
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
                             It also calculates Delta and Vega for hedging purposes.'),
                    helpText('The application works like a regular calculator. You first select the option type: Call or Put. 
                             Then enter the required parameters: stock price, strike price, stock volatility, risk-free interest
                             rate, and time to expiration (in years). For instance, if the option expires in 6 months, enter 0.5
                             in the time to expiration box. Having entered all required information, hit the Calculate button. 
                             The results, which include option price, delta and vega, will appear along with the information 
                             you entered.')
                    
                    )
        )

    )
  )
))
