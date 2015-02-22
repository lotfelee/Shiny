library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(  
        headerPanel("Data Set Explorer!"),        
        sidebarPanel(selectInput("dataset", "Choose a dataset:",choices = c("mtcars","airquality", "rock")),
                     conditionalPanel(
                             condition = "input.func == 'head'",numericInput("obs", "Number of observations to view:", 10)),
                     radioButtons("func", "Function",c("Plot" = "plot","Summary" = "summary","Structure" = "str","View"="head"))
                     ,helpText("Data Sets Explorer may be used to explore any data set here i limited my self to three data sets only 
                               if you chose:plot :The app wil calculate the correlations between all the variables in the data sets
                               and show nice heat map exploring these correlations summary : you will get summary of the data set ,   
                              view: you will show you the first n rows of the data sets based on the value you enter in the number of 
                               the observations the numeric input box , Structure: you will get the general structure of the data set ")),
        mainPanel(
                conditionalPanel(
                        condition = "input.func == 'plot'",plotOutput("distPlot")),
                conditionalPanel(
                        condition = "input.func == 'summary'",verbatimTextOutput("summary")),
                conditionalPanel(
                        condition = "input.func == 'str'",verbatimTextOutput("Structure")),
                conditionalPanel(
                        condition = "input.func == 'head'",tableOutput("view")))))

