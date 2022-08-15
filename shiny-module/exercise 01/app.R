library(shiny)

counterButton <- function(id, label = "Counter") {
    # complete the module UI part
    actionButton("button"), label = label),
    verbatimTextOutput("out")
}

counterServer <- function(id) {
    # complete the module server part
    moduleServer(
        id,
        function(input, output, session) {
            count <- reactiveVal(0)
            observeEvent(input$button, {
                count(count() + 1)
            })
        }
    )
}

ui <- fluidPage(
    counterButton("counter1", "Counter #1"),
)

server <- function(input, output, session) {
    counterServer("counter1")
}

shinyApp(ui, server)