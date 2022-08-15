library(shiny)

counterButton <- function(id, label = "Counter") {
    ns <- NS(id)
    tagList(
        actionButton(ns("button"), label = label),
        verbatimTextOutput(ns("out"))
    )
}

counterServer <- function(id) {
    moduleServer(
        id,
        function(input, output, session) {
            count <- reactiveVal(0)
            observeEvent(input$button, {
                count(count() + 1)
            })
            output$out <- renderText({
                count()
            })
            count
        }
    )
}

ui <- fluidPage(
    counterButton("counter1", "Counter #1"),
    hr(),
    counterButton("counter2", "Counter #2"),
    hr(),
    counterButton("counter3", "Counter #3"),
)

server <- function(input, output, session) {
    counterServer("counter1")
    counterServer("counter2")
    counterServer("counter3")
}

shinyApp(ui, server)