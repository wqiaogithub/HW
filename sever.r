#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- seq(0,1,length=1000)
    y<-dbeta(x,input$a1,input$b1)
    z<-dbeta(x,input$a2,input$b2)
    final<-max(c(y,z))
    finaly<-seq(0,final,length=1000)
    # draw the density plot with the specified parameter
    plot(x,finaly,type="n",xlab="x",ylab="probability density")
    lines(x,y,col=1,lwd=2)
    lines(x,z,col=2,lwd=2)
    legend(0.8,final-2,c("beta1","beta2"),col=c(1,2),lty=1)
    
  })
  
  
  output$prob <- renderText({
    pbetaineq <- function(alpha1,beta1,alpha2,beta2) {
      fb <- function(x){x**(alpha1-1) * (1-x)**(beta1-1) * pbeta(x,alpha2,beta2) / beta(alpha1,beta1)}
      res <- integrate(fb,0,1)
      res$value
    }
    pbetaineq(input$a1,input$b1,input$a2,input$b2)
  })
})
