library(shiny)


shinyUI(pageWithSidebar( 
  
  headerPanel("Decay Functions"),
  sidebarPanel(
    tabsetPanel(
      tabPanel(
        "Input",
        withMathJax(),
        p('Function of form \\( y = exp(a*(x/b)^k) \\)'),
        withMathJax(),
        numericInput('id1', 'Power \\(k\\) (please enter 1 or 2) ', 1, min = 1, max = 2, step = 1),
        withMathJax(),
        sliderInput('lengthscale', 'Enter Length Scale \\(b\\)',value = 4, min = 1, max = 20, step = 0.1),
        sliderInput('coefficient', label = 'Enter Multiplier \\(a\\)',value = -.5, min = -4, max =-.1 , step = 0.1),
        textInput('xval', 'Enter a particular value of \\(x\\)', value = "", width = NULL)
      ),
      tabPanel(
        "Documentation", 
        verbatimTextOutput("documentationtext"))
    )),

  mainPanel(
    plotOutput("decayfunct"),
    h4('The y - value is:'),
    verbatimTextOutput("yval")
    
  )
  
)) 