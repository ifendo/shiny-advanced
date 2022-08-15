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
    output$s1 <- renderPrint({
        summary(rnorm(input$nsamples))
    })

    output$p1 <- renderPlot({
        hist(rnorm(input$nsamples))
    })
}
shinyApp(ui, server)