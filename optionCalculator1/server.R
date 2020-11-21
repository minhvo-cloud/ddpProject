
library(shiny)
library(ragtop)
library(car)

# Define server logic required to calculate option price
shinyServer(function(input, output) {
        value <- reactiveValues()
        
# Calculate oprion price
        observe({
        input$Calc
        value$Price <- isolate(blackscholes(callput = as.numeric(input$type),S0 = input$p,K= input$k,r = input$r/100,time = input$t,
                vola = input$sigma/100)$Price)
        value$Delta <- isolate(blackscholes(callput = as.numeric(input$type),S0 = input$p,K= input$k,r = input$r/100,time = input$t,
                                                    vola = input$sigma/100)$Delta)
        value$Vega <- isolate(blackscholes(callput = as.numeric(input$type),S0 = input$p,K= input$k,r = input$r/100,time = input$t,
                                    vola = input$sigma/100)$Vega)       
        
                })
     
  # Display inputs
    
        output$textType <- renderText({
                input$Calc
                isolate(paste('Option type: ', isolate(recode(input$type, "'-1'='Put'; '1'='Call'"))))
        })
        output$textPrice <- renderText({
                input$Calc
                isolate(paste('Stock price ($): ', isolate(input$p)))
        })
        output$textStrike <- renderText({
                input$Calc
                isolate(paste('Strike price ($): ', isolate(input$k)))
        })
        output$textRate <- renderText({
                input$Calc
                isolate(paste('Risk-free interest rate (%): ', isolate(input$r)))
        })
        output$textVol <- renderText({
                input$Calc
                isolate(paste('Volatility (%): ', isolate(input$sigma)))
        })
        output$textTime <- renderText({
                input$Calc
                isolate(paste('Time to expiration (years): ', isolate(input$t)))
        })
       
        
#       Display results
        output$textOptionPrice <- renderText({
                input$Calc
                isolate(paste('Option price ($): ', round(value$Price,2)))
        })
        output$textDelta <- renderText({
               input$Calc
                isolate(paste('Delta: ', round(value$Delta,4)))
        })
        output$textVega <- renderText({
                input$Calc
                isolate(paste('Vega: ', round(value$Vega,4)))
        })
        

  
})
