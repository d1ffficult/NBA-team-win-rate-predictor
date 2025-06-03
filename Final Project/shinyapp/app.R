library(shiny)
library(httr)
library(jsonlite)

get_team_comparison <- function(teamA, teamB, season) {
  url <- "https://flask-app-nba-895074510468.us-central1.run.app/predict_win_rate"
  
  body <- list(teamA = teamA, teamB = teamB, season = season)
  
  res <- POST(url, body = body, encode = "json")
  if (res$status_code != 200) return(NULL)
  
  content <- content(res, "parsed", simplifyVector = TRUE)
  
  list(
    win_rate = content$win_rate
  )
}

ui <- fluidPage(
  titlePanel("Team Win Rate Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("teamA", "Team A:", value = "Golden State Warriors"),
      textInput("teamB", "Team B:", value = "Boston Celtics"),
      textInput("season", "Season (e.g., 2014-15):", value = "2014-15"),
      actionButton("submit", "Compare")
    ),
    
    mainPanel(
      uiOutput("result")
    )
  )
)

server <- function(input, output) {
  result_data <- eventReactive(input$submit, {
    get_team_comparison(input$teamA, input$teamB, input$season)
  })
  
  output$result <- renderUI({
    res <- result_data()
    if (is.null(res)) return("API call failed or teams not found.")
    
    tagList(
      h3(sprintf("Win Probability: %s wins %.2f%% of the time",
                 input$teamA, 100 * res$win_rate))
    )
  })
}

shinyApp(ui = ui, server = server)
