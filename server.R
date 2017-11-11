#
# This is the server logic of my Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ISLR)

# Define server logic required to draw a Balance prediction plot
shinyServer(function(input, output) {
  
# Two simple regression models using Income, Ethnicity, Married and Student variables
  model1 <- lm(Balance ~ Income,  data = Credit)
  model2 <- lm(Balance ~ Income + Ethnicity + Married + Student, data = Credit)


# Model 1 prediction   
  model1pred <- reactive({
    
# Defining inputs for model1
  incomeInput <- input$sliderIncome
    
    
  predict(model1, newdata = data.frame(Income = incomeInput))
    
  })

# Model 2 prediction   
  model2pred <- reactive({
    
# Defining inputs for model2
  incomeInput <- input$sliderIncome
  ethnicityInput <- input$ethnicity
  marriedInput <- input$married
  studentInput <- input$student
    
    
  predict(model2, newdata = data.frame(Income = incomeInput, Ethnicity = ethnicityInput,
                                         Married = marriedInput, Student = studentInput))
    
                                       
  })
  
 
# Plot1 producing commands
  output$plot1 <- renderPlot({
    
    incomeInput <- input$sliderIncome
    
    par(bg = 'lightgrey')
    plot(Credit$Income, Credit$Balance, xlab = "Income(in $10,100 unit)",
         ylab = "Balance(in $)", bty = "n", pch = 16,
         xlim = c(10, 200), ylim = c(0, 2000), cex = 0.8, main = "Balance Prediction Distribution")
    
    
# Checking Checkbox1    
    if(input$showModel1){
      legend(25, 2100, "Model 1 Prediction", pch = 18,
             col = "red", bty = "n", cex = 1.5)
      points(incomeInput, model1pred(), col = "red", pch = 18, cex = 3)
    }
    
# Checking Checkbox2    
    if(input$showModel2){
      legend(25, 1900, "Model 2 Prediction", pch = 8,
             col = "blue", bty = "n", cex = 1.5)
      points(incomeInput, model2pred(), col = "blue", pch = 8, cex = 2)
    }    

    
    })
  
# prediction text
    output$pred1 <- renderText({
    model1pred()

    })
    output$pred2 <- renderText({
    model2pred()    
      
  })
  
    
  })
  