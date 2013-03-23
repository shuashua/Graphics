library(shiny)

FM = read.csv("/Users/shuhualiang/Documents/Davis MS/STA 242/Final/FM.csv")

names(FM)[names(FM)=="x"] = "lon"
names(FM)[names(FM)=="y"] = "lat"

shinyUI(pageWithSidebar(
	headerPanel("Market Products"),
		sidebarPanel(selectInput(
			"Prod", 
			"Products:",
			list("Bakedgoods", 
				"Cheese", 
				"Eggs", 
				"Seafood", 
				"Herbs", 
				"Vegetables", 
				"Honey", 
				"Jams", 
				"Maple", 
				"Meat", 
				"Nuts", 
				"Poultry", 
				"Prepared", 
				"Soap", 
				"Wine"))),

	mainPanel(tabPanel("Plot", plotOutput("plot"))
)
))
