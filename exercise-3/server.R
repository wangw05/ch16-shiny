### Exercise 3 ###

library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 

# It should take as an input the x_var, y_var, color, and size
# Save the result of `renderPlot` to output$scatter
server <- function(input, output){
  # Store x and y values to plot
  output$scatter <- renderPlot({
  
    x <- mpg[[input$x_var]]
    y <- mpg[[input$y_var]]
    
    title <- paste0("MPG Data: ", x, "vs. ", y)
    
    p <- ggplot() +
      geom_point(mapping = aes(x = x, y = y), 
                 size = input$size, 
                 color = input$color) +
      labs(x = input$x_var, y = input$y_var, title = title)
    p
      
  })
}

shinyServer(server)
