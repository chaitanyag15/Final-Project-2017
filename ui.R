#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny) 
library(plotly)

# Define UI for application that draws a histogram
shinyUI(navbarPage(
    

  title = "Searching Twitter",
  theme = 'bootstrap.css',
  tabPanel("Word Clouds", 
    sidebarLayout(
          
      # Inputs (Dropdown menu, textbox, slider, submit button)
      sidebarPanel(
        selectInput(inputId = 'searchInput', 'Select:', c('Search' = 'Search', 
                                                          'User\'s Timeline' = 'User',
                                                          'Trending' = 'Trending')),
        uiOutput('searchtype'),
        sliderInput(inputId = 'nResults', "Number of Tweets: (more tweets = longer search)", 
                    min = 25, max = 500, value = 50),
        actionButton("Search", 'Search')
      ),
             
      # Show the plots
      mainPanel(
        h3(textOutput("search")),
        splitLayout(
          plotOutput("wordcloud"),
          plotOutput("sentimentcloud")
        ),
        plotlyOutput("feeling")
      )
        
    ),
    tags$p(
      tags$div(
        id = 'desciption',
        
        includeHTML('html/Word.html')
      )
    )   
  ),
  
  tabPanel("Map",
    mainPanel(
      plotlyOutput("map")
    ),
    tags$p(
      tags$div(
        id = 'desciption',
        
        includeHTML('html/Map.html')
      )
    )
      
    
  ),
  
  tabPanel("Plot", 
    sidebarLayout(
      sidebarPanel(
        selectInput(inputId = 'y_input', 'Select Y axis:', c('Following' = 'following', 
                                                         'Number of Tweets' = 'tweets'))),
       mainPanel(
         plotlyOutput("accounts")
       )
      
    ),
    tags$p(
      tags$div(
        id = 'desciption',
        
          includeHTML('html/Plot.html')
      )
    )
  ),
  tabPanel("About", 
  tags$p(
    tags$div(
      id = 'desciption',
      
      includeHTML('html/about.html')
    )
  )
)
))
