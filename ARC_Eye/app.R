#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/


library(ggplot2)
library(readr)
library(shiny)

################### Frontend ########################


ui = fluidPage(
    fluidRow(
        column(2,
               tableOutput('data')
        )
    )
)



################### Backend ########################

# Data Input

server <- function(input, output, session) {
    Pupil_Left <-
        reactiveFileReader(100,
                           session,
                           '~/Unreal Projects/MyProject/Left_Eye_Dilation.csv',
                           read.csv,header=FALSE)

# Renders Table For Call Above
    
    output$data <- renderTable({
        Pupil_Left()
    })

    
# Make Plot for Dilation Data
    
  #  output$plot <- renderPlot({
   
   #     ggplot(Pupil_Left,aes())
        
        
        
        
    #})
    
    }

# Launch App

shinyApp(ui, server)
