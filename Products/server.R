library(shiny)
library(maps)

FM = read.csv("/Users/shuhualiang/Documents/Davis MS/STA 242/Final/FM.csv")

names(FM)[names(FM)=="x"] = "lon"
names(FM)[names(FM)=="y"] = "lat"

shinyServer(function(input, output) {
ind <- reactive({
    switch(input$Prod, 
    			Bakedgoods = FM[['Bakedgoods']], 
				Cheese = FM[['Cheese']], 
				Eggs = FM[['Eggs']], 
				Seafood = FM[['Seafood']], 
				Herbs = FM[['Herbs']], 
				Vegetables = FM[['Vegetables']], 
				Honey = FM[['Honey']], 
				Jams = FM[['Jams']], 
				Maple = FM[['Maple']], 
				Meat = FM[['Meat']], 
				Nuts = FM[['Nuts']], 
				Poultry = FM[['Poultry']], 
				Prepared = FM[['Prepared']], 
				Soap = FM[['Soap']], 
				Wine = FM[['Wine']])
  })

	output$plot <- renderPlot({
    	Use = which(ind()=='Y')

    	map("state")
    	points(x=FM[['lon']][Use], y=FM[['lat']][Use], pch=16, col="pink")
  })

})
