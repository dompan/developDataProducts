shinyUI(pageWithSidebar(
        headerPanel('mtcars k-means Clustering'),
        sidebarPanel(
                       
                selectInput('x', 'X Variable', names(mtcars)),
                selectInput('y', 'Y Variable', names(mtcars),
                selected=names(mtcars)[[2]]),
                
                numericInput('num_clusters', 'Cluster count', 4,min = 1, max = 9)
        ),
        
        mainPanel(
                plotOutput('plot')
        )
))