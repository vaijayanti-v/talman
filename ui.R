library(shiny)

shinyUI(fluidPage(
titlePanel("Employee Longevity"),
sidebarLayout(
  sidebarPanel("Enter candidate details here",
               selectInput("college", label="Select College",
                           choices=list("PESITB"=10,"RVCEB"=9,"UVCEB"=8,"JSSCEB"=3,"MVITB"=4,"BMSCEB"=5,"MSRITB"=2,"BITB"=1,"NITS"=7,"MITM"=6), selected=1
               ),
               selectInput("father", label="Select Father's Occupation",
                           choices=list("Banker"=6,"Govt"=5,"Doctor"=4,"Agriculturist"=2,"Business"=3,"Teacher"=1), selected=1
               ),
               selectInput("gender", label="Select Gender",
                           choices=list("male"=2,"female"=3), selected=2
               ),
               selectInput("branch", label="Select Branch",
                           choices=list("CSE"=5,"ECE"=4,"EEE"=2,"IS/IT"=3,"Inst"=2,"Mech"=2), selected=5
               ),
               selectInput("recruitment", label="Select Mode of recruitment",
                           choices=list("OnCampus"=3,"OffCampus"=1,"PoolCampus"=2), selected=1
               )               
               
               ),
  
  mainPanel(align="center",
            h2(textOutput("longevity")),
            h2(textOutput("longevity_NN"))
#             imageOutput("image")
          )
  ),



fluidRow(
  align="center",
  submitButton("Submit")
)
))