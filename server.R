palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output) {
        selectedData <- reactive({
                mtcars[, c(input$x, input$y)]
        })
        
        clusters <- reactive({
                kmeans(selectedData(), input$num_clusters)
        })
        
        output$plot <- renderPlot({
                par(mar = c(5, 4, 0, 1))
                plot(selectedData(),col = clusters()$cluster,pch = 20, cex = 3)
                points(clusters()$centers, pch = 4, cex = 3, lwd = 3)
        })
        
})