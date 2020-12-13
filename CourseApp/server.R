library(shiny)
library(datasets)
library(ggpubr)

toothData <- ToothGrowth

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("len ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("len ~", "as.integer(", input$variable, ")")
    })
    
    fit <- reactive({
        lm(as.formula(formulaTextPoint()), data=toothData)
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$toothBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = toothData)
    })
    
    output$fit <- renderPrint({
        summary(fit())
    })
    
    output$toothPlot <- renderPlot({
        with(toothData, {
            plot(as.formula(formulaTextPoint()))
            abline(fit(), col=2)
        })
    })
    
})
