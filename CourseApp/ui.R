library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               tabPanel("Background with the dataset",
                        
                        h3("Statistical Inference Course Project (Part 2)"),
                        helpText("This dataset was previouly in part 2 of the assignment project of the Statistcal Inference course, offered through Coursera. On that project, it was checked if the type of supplement and dose had an impact on tooth growth.",
                                 "You can check this link to see how the analysis was done. Nonetheless, we'll perform pretty much the same analysis applied to the Shiny App"),
                        
                        a("https://coursera-assessments.s3.amazonaws.com/assessments/1600715936181/e1571097-8fd5-4162-8c44-b294cc4d74b7/Part%202%20-%20Basic-Inferential-Data-Analysis.pdf")
               ),
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("Correlation between tooth growth and dose supplement"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Supplement" = "supp",
                                                  "Dose" = "dose"
                                                ))
                                    
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("toothBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("toothPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               )
    )
)
