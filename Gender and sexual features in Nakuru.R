## Only run this example in interactive R sessions
if (interactive()) {
  # Basic dashboard page template
  library(shiny)
  shinyApp(
    ui = dashboardPage(
      dashboardHeader(title="Sexual and Gender Based Violence in Nakuru"),
      dashboardSidebar(
        sidebarMenu(
          menuItem("Gender", tabName="gender",icon=icon("tree")),
          menuItem("Sexuality", tabName="rape",icon=icon("tree"))
        )
      ),
      dashboardBody(
        tabItems(
          tabItem("gender",
                  box(plotOutput("correlation_plot"),width=8),
                 box(
                   selectInput("features","Features:",
                               c("No_of_perpetrators","Total_survivors_with_disability"))
                 ) ),
          tabItem("car",
                  fluidPage(
                    h1("Car"),
                    dataTableOutput("Dataset")
                  )
          )
          
        )
      ),
      title = "Dashboard example"
    ),
    server = function(input, output) {
      output$correlation_plot<-renderPlot({
        plot(gender$No_of_rape_survivors,gender[[input$features]], 
             xlab ="No_of_survivors", ylab="Features")
      })
      output$Dataset<-renderDataTable(gender)
      
    }
  )
}