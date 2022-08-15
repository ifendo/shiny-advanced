library(shiny)
library(ggplot2)
library(dplyr)
library(shinycssloaders)

# a sample data frame
data <- data.frame(
    "category" = c('A', 'B', 'C', 'D'),
    "amount" = c(21, 46, 27, 6)
)

ui <- fluidPage(
    fluidRow(
        column(
            width = 2,
            actionButton(
                "bar",
                "",
                icon = icon("chart-bar")
            ),
            actionButton(
                "pie",
                "",
                icon = icon("chart-pie")
            ),
        ),
        column(
            width = 10,
            plotOutput("p1")
        )
    )
)

server <- function(input, output, session) {
    # complete the server part
}

shinyApp(ui, server)