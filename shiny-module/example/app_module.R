library(shiny)

histUI <- function(id){
    ns <- NS(id)
    tagList(
        selectInput(ns("var"), "Variable", choices = names(mtcars)),
        numericInput(ns("bins"), "bins", value = 10, min = 1),
        plotOutput(ns("hist"))
    )
}

histServer <- function(id) {
    moduleServer(id, function(input, output, session) {
        data <- reactive(mtcars[[input$var]])
        output$hist <- renderPlot({
            hist(data(), breaks = input$bins, main = input$var)
        }, res = 96)
    })
}

ui <- fluidPage(
    histUI("hist1")
)
server <- function(input, output, session) {
    histServer("hist1")
}
shinyApp(ui, server)