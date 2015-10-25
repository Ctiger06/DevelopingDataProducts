library(ggplot2)
library(shiny)

mydecayfunction<- function (y,a1, b1, d1) exp(a1*(y/b1)^d1)

shinyServer(
  function(input, output) {
    output$decayfunct <- renderPlot({
      a<-input$coefficient
      b<-input$lengthscale
      d<-input$id1
      x<-c(0,30)
      xinput<-as.numeric(input$xval)
      yinput<-mydecayfunction(xinput,a,b,d)
      xdat<-data.frame(x)
      g<- ggplot(xdat,aes(x)) 
      g<-g  + stat_function(fun = mydecayfunction, args=list(a1=a, b1=b, d1=d), color = "red")
      g<-g + geom_hline(yintercept=yinput) + geom_vline(xintercept = xinput)
      print(g)
         })
    output$yval<-renderPrint({
     x<-as.numeric(input$xval)
      mydecayfunction(x,input$coefficient,input$lengthscale,input$id1)
    })
    output$documentationtext<-renderText({
      "Please input values for a, b, and k in the defined function, and a particular value of x  for which you would like the y value displayed. The exponential decay function will be plotted to the right."
    })
    
 
    
    
  }
)


