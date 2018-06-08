
library(shiny)
library(dplyr)
library(ggplot2)

# Define UI for application
shinyUI(fluidPage(

  # Application title
  titlePanel("Relationship of petal length and petal width"),

  # Sidebar with slider inputs
  sidebarLayout(
    sidebarPanel(h4("Here you select the minimum and maximum values that you want to be displayed
                 on the scatter plot",style="color:red"),
                 "",
       sliderInput("SepalLengthInput",
                   "Sepal length:",
                   min = 4.3,
                   max = 7.9,
                   value = c(4.3,7.9),
                   pre="cm",
                   step=0.1),
       sliderInput("SepalWidthInput",
                   "Sepal width:",
                   min = 2,
                   max = 4.4,
                   value = c(2,4.4),
                   pre="cm",
                   step=0.1),
       h4("Please tick the box below if you want to color the different species", style="color:red"),
       checkboxInput("SpeciesColor",
                   "Show Species",
                   value=TRUE),
       h4("Finally, select which model you want to use to fit the data on the plot", style="color:red"),
        selectInput("model",
                    "Model type",
                    choices=c("None"="none",
                    "Linear"="lm",
                    "Smooth"="smooth"))
    ),

    # Show a plot of the generated scatter graph
    mainPanel(
       plotOutput("scatterPlot")
    )
  )
))
