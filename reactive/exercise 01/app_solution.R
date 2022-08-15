library(shiny)
library(shinycssloaders)
library(dplyr)
library(ggplot2)

# a sample data frame
data <- data.frame(
    "category" = c("A", "B", "C", "D"),
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
            plotOutput("p1") %>%
            withSpinner()
        )
    )
)

server <- function(input, output, session) {
    rv <- reactiveValues(
        plot = NULL
    )

    # bar chart
    observeEvent(input$bar, {
        rv$plot <- ggplot(data, aes(x = category, y = amount, fill = category)) +
            geom_bar(stat = "identity")
    })

    # pie chart
    observeEvent(input$pie, {
        rv$plot <- ggplot(data, aes(x = "", y = amount, fill = category)) +
            geom_bar(stat = "identity", width = 1) +
            coord_polar("y", start = 0)
    })

    output$p1 <- renderPlot({
        rv$plot
    })
}

shinyApp(ui, server)