#
# This is the user-interface definition of my Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# My App is about predicting the Balance using 
# Income, Gender, Student, Married, Ethnicity status from the 
# Credit data of ISLR package.


library(shiny)
library(ISLR)


  # Define UI for application that predicts Balance
shinyUI(fluidPage(
  

  # Webpage styling commands  
  tags$head(
    tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
  h1 {
  font-family: 'Lobster';
                    font-weight: 100;
                    line-height: 1.5;
                    color: #000000;
                    }
                    
    
                    body {
                    font-family: 'Comic Sans MS', cursive;
                    #font-weight: 500;
                    #line-height: 1.1;
                    background-color: hsl(0, 0%, 83%);
                    color: #000000;
                    }
                    
                    "))
    ),
  
  
  
  # Application title
  titlePanel(h1("Balance Prediction:")),
  
  # Sidebar with a various inputs 
  sidebarLayout(
    sidebarPanel(
      
      h3("Choose your variables"),
      
  # Select various inputs
      selectInput("student", "Select whether Student", c("No", "Yes")),
      selectInput("ethnicity", "Select Ethnicity", c("African American", "Asian", "Caucasian")),
      selectInput("married", "Select whether Married", c("No", "Yes")),
      
      
  # Income slider
      em("Following income is in $10,000 unit"),
      sliderInput("sliderIncome", "What is the income of the person?", 10, 200, value = 100),
      
  # Checkbox 1 and 2
   checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
   checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
  
  # Submit button is a must for me
   submitButton("Submit")
  
    ),
  
   
  # Main panel documentation text
    mainPanel(
      h3("Documentation"),
      
      h4("Purpose:"),
      h5("This is a webpage which I build using Shiny package for the final assignment of Developing 
         Data Product course of John Hopkins University through Coursera. This is a simple interactive 
         page where I try to predict the Balance variable from Credit data of ISLR package using two 
         different regression models."),
      
      h4("Data:"),
      h5("Credit is a data frame with 400 observables and 12 variables out of which I am using one
          numerical variable Income, one integer variable Balance and three factor variables Student, 
          Ethnicity and Married for my two models. For details about the data frame please see the 
          following site."),
      h6(em("Ref: https://cran.r-project.org/web/packages/ISLR/ISLR.pdf")),
      
      h4("Model Description:"),
      h5("* Model 1: Outcome: Balance; Predictor: Income."),
      h5("* Model 2: Outcome: Balance; Predictor: Income, Student, Ethnicity, Married."),
      
      h4("Input:"),
      h5("I have specified all the available choices of four inputs: Student, Ethnicity, Married
         and Income. All you have to do is to choose any of the possible inputs and press submit button.
         You can choose all possible combinations of the two checkboxes for Model 1 and Model 2."),
      
      h4("Output:"),
      h5("Depending on your choice of inputs you will be able to see the model predictions of the 
         balance output number and it's position in the data distribution diagram."),
      
    # Plot output
        plotOutput("plot1"),
    
    # Prediction texts
        h3("Predicted Balance from Model 1:"),
        textOutput("pred1"),
        h3("Predicted Balance from Model 2:"),
        textOutput("pred2"),
    
    # One definitely deserves a thanks for reading so much!!!
      h3("Thank You !!")
      
    )
    
  )
))
