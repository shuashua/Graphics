library(shiny)

FM = read.csv("/Users/shuhualiang/Documents/Davis MS/STA 242/Final/FM.csv")

names(FM)[names(FM)=="x"] = "lon"
names(FM)[names(FM)=="y"] = "lat"

states = as.character(unique(FM[['State']]))

#states = c("Virginia","Texas")

shinyUI(pageWithSidebar(
	headerPanel("Farmers Markets by States"),
		sidebarPanel(radioButtons(
			"State", "State:", states)),

	mainPanel(htmlOutput("view"))
))
