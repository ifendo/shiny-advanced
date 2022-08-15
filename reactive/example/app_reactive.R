library(shiny)

ui <- fluidPage(
    numericInput(
        "nsamples",
        "# of samples",
        value = 10
    ),
    verbatimTextOutput("s1"),
    plotOutput("p1")
)
server <- function(input, output, session) {
    samples <- reactive(rnorm(input$nsamples))
    output$s1 <- renderPrint({
        summary(samples())
    })

    output$p1 <- renderPlot({
        hist(samples())
    })
}
shinyApp(ui, server)