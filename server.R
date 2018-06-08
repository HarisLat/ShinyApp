library(shiny)


shinyServer(function(input, output) {

  output$scatterPlot <- renderPlot({

    minSepalLength<-input$SepalLengthInput[1]
    maxSepalLength<-input$SepalLengthInput[2]

    # Filter data based on user input
    filtered<-iris %>%
            filter(Sepal.Length>=input$SepalLengthInput[1],
                   Sepal.Length<=input$SepalLengthInput[2],
                   Sepal.Width>=input$SepalWidthInput[1],
                   Sepal.Width<=input$SepalWidthInput[2])
        # Color code the flower type
    if (input$SpeciesColor==TRUE){
            g<-ggplot(filtered,aes(x=Sepal.Length,y=Sepal.Width,color=Species))+
                    geom_point(size=5,alpha=0.5)+
                    theme(legend.position="bottom")
    }
    else{
            g<-ggplot(filtered,aes(x=Sepal.Length,y=Sepal.Width))+
                    geom_point(size=5,alpha=0.5)
    }
    # Plot
    g<-g+labs(title="Iris data")+
            xlab("Sepal length in cm")+
            ylab("Sepal width in cm")+
            scale_y_continuous(labels=scales::comma)+
            scale_x_continuous(labels=scales::comma)

    # Display model fit
    ## Linear Model Fit
    if (input$model == "lm") {
            g <- g + geom_smooth(method = "lm")
    }

    ## Smooth Model Fit
    else if (input$model == "smooth") {
            g <- g + geom_smooth(method = "loess")
    }

    g



  })

})
