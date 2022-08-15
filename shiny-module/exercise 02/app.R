library(shiny)
library(dplyr)

countButtonUI <- function(id) {
    ns <- NS(id)
    tagList(
        fluidRow(
            column(
                width = 12,
                actionButton(ns("like"), label = "Like: ", icon = icon("thumbs-up"), class = "primary"),
                actionButton(ns("dislike"), label = "Dislike: ", icon = icon("thumbs-down"), class = "primary")
            )
        ),
        fluidRow(
            column(
                width = 12,
                imageOutput(ns("myImage"))
            ),
        )
    )
}

countButtonServer <- function(id, image) {
    moduleServer(
        id,
        function(input, output, session) {
            like_count <- reactiveVal(0)
            observe({
                like_count(like_count() + 1)
            }) %>%
                bindEvent(input$like)

            dislike_count <- reactiveVal(0)
            observe({
                dislike_count(dislike_count() + 1)
            }) %>%
                bindEvent(input$dislike)

            output$myImage <- renderImage(
                {
                    list(
                        src = image,
                        height = "60%",
                        alt = "A pic"
                    )
                },
                deleteFile = FALSE
            )

            observe({
                updateActionButton(
                    inputId = "like", label = paste0("Like: ", like_count()),
                )

                updateActionButton(
                    inputId = "dislike", label = paste0("Dislike: ", dislike_count()),
                )
            })
        }
    )
}

ui <- fluidPage(
    countButtonUI("count1"),
    # add some more gifs
)

server <- function(input, output, session) {
    countButtonServer("count1", image = "hadley.gif")
    # add some more gifs

}

shinyApp(ui, server)