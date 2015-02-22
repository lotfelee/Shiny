library(shiny)
library(ggplot2)
library(reshape2)
library(datasets)
# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
        
        datasetInput <- reactive({
                switch(input$dataset,
                       "airquality" = airquality,
                       "rock" = rock,
                       "mtcars" = mtcars)
        })
        
        output$summary <- renderPrint({
                dataset <- datasetInput()
                summary(dataset)
        })
        output$Structure<-renderPrint({
                dataset <- datasetInput()
                str(dataset)
        })
        
        #Calculating Correlation matrix between various variables in the data set
        output$distPlot <- renderPlot({
                dataset <- datasetInput()
                plot<-qplot(x=Var1, y=Var2, data=melt(cor(dataset, use="p")), fill=value, geom="tile")
                plot+scale_fill_gradient2(limits=c(-1, 1))+ggtitle("Data set variables correlations")
        })
        output$view <- renderTable({
                head(datasetInput(), n = input$obs)
        })
})