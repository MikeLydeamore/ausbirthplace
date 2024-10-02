#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
reactlog::reactlog_enable()

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Second App!"),



    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          selectizeInput("speciesSelect", label = "Species", choices = unique(penguins$species), multiple = TRUE),
          sliderInput("lengthSlider", label = "Bill length",
                      min = min(penguins$bill_length_mm, na.rm=T), max = max(penguins$bill_length_mm, na.rm=T),
                      value = max(penguins$bill_length_mm, na.rm=T))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotlyOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlotly({

      my_plot <- penguins |>
        filter(bill_length_mm <= input$lengthSlider) |>
        filter(species %in% input$speciesSelect) |>
        ggplot(aes(x=bill_length_mm, y = bill_depth_mm, colour = species)) +
        geom_point()

      ggplotly(my_plot)

    })

}

# Run the application
shinyApp(ui = ui, server = server)
