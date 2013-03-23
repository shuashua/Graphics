library(shiny)
library(googleVis)

FM = read.csv("/Users/shuhualiang/Documents/Davis MS/STA 242/Final/FM.csv")

names(FM)[names(FM)=="x"] = "lon"
names(FM)[names(FM)=="y"] = "lat"

LatLong = paste(FM$lat,":",FM$lon, sep="")
Marks = paste(FM$FMID,"<BR>",paste("Location: ",FM$Location),"<BR>",paste("Credit: ",FM$Credit,sep=""),"<BR>",paste("WIC: ",FM$WIC,sep=""),"<BR>",paste("WICcash: ",FM$WICcash,sep=""), sep="")

FM = cbind(FM,LatLong,Marks)

#states = as.character(unique(FM[['State']]))

shinyServer(function(input, output) {
ind <- reactive({
    switch(input$State,
    		"Virginia" = FM[which(FM[['State']] == "Virginia"),],
    		"Georgia" = FM[which(FM[['State']] == "Georgia"),],
    		"Michigan" = FM[which(FM[['State']] == "Michigan"),],
			"New York" = FM[which(FM[['State']] == "New York"),],
   			"Delaware" = FM[which(FM[['State']] == "Delaware"),],      
    		"District of Columbia" = FM[which(FM[['State']] == "District of Columbia"),],
    		"Pennsylvania" = FM[which(FM[['State']] == "Pennsylvania"),],
    		"Minnesota" = FM[which(FM[['State']] == "Minnesota"),],
    	    "New Jersey" = FM[which(FM[['State']] == "New Jerse"),],
    		"Wisconsin" = FM[which(FM[['State']] == "Wisconsin"),],
    		"California" = FM[which(FM[['State']] == "California"),],
    		"Oregon" = FM[which(FM[['State']] == "Oregon"),],
   			"Illinois" = FM[which(FM[['State']] == "Illinois"),], 
   	        "Maryland" = FM[which(FM[['State']] == "Maryland"),], 
   	        "Indiana" = FM[which(FM[['State']] == "Indiana"),],
   	        "Nevada" = FM[which(FM[['State']] == "Nevada"),],
   	        "Colorado" = FM[which(FM[['State']] == "Colorado"),],
            "Kentucky" = FM[which(FM[['State']] == "Kentucky"),],
    	    "Texas" = FM[which(FM[['State']] == "Texas"),],
    		"Iowa" = FM[which(FM[['State']] == "Iowa"),],
    		"Florida" = FM[which(FM[['State']] == "Florida"),], 
    		"Alabama" = FM[which(FM[['State']] == "Alabama"),],
    		"South Carolina" = FM[which(FM[['State']] == "South Carolina"),],
   			"South Dakota" = FM[which(FM[['State']] == "South Dakota"),],
   			"Kansas" = FM[which(FM[['State']] == "Kansas"),],
   			"Massachusetts" = FM[which(FM[['State']] == "Massachusetts"),],
    		"New Mexico" = FM[which(FM[['State']] == "New Mexico"),],
    		"Maine" = FM[which(FM[['State']] == "Maine"),],
   			"Louisiana" = FM[which(FM[['State']] == "Louisiana"),],
   			"Ohio" = FM[which(FM[['State']] == "Ohio"),],
   			"Oklahoma" = FM[which(FM[['State']] == "Oklahoma"),],
   			"Tennessee" = FM[which(FM[['State']] == "Tennessee"),],    	
   			"Arizona" = FM[which(FM[['State']] == "Arizona"),],
    		"Hawaii" = FM[which(FM[['State']] == "Hawaii"),],
    		"North Carolina" = FM[which(FM[['State']] == "North Carolina"),],
    		"Nebraska" = FM[which(FM[['State']] == "Nebraska"),],
   			"Idaho" = FM[which(FM[['State']] == "Idaho"),],
   			"New Hampshire" = FM[which(FM[['State']] == "New Hampshire"),],
   			"West Virginia" = FM[which(FM[['State']] == "West Virginia"),],
    		"Washington" = FM[which(FM[['State']] == "Washington"),],
    	    "North Dakota" = FM[which(FM[['State']] == "North Dakota"),],
    		"Alaska" = FM[which(FM[['State']] == "Alaska"),],
   			"Virgin Islands" = FM[which(FM[['State']] == "Virgin Islands"),],
   			"Rhode Island" = FM[which(FM[['State']] == "Rhode Island"),],
   			"Missouri" = FM[which(FM[['State']] == "Missouri"),],
   			"Arkansas" = FM[which(FM[['State']] == "Arkansas"),],    		
   			"Connecticut" = FM[which(FM[['State']] == "Connecticut"),],
    		"Utah" = FM[which(FM[['State']] == "Utah"),],
   			"Mississippi" = FM[which(FM[['State']] == "Mississippi"),],
   			"Vermont" = FM[which(FM[['State']] == "Vermont"),],
   			"Wyoming" = FM[which(FM[['State']] == "Wyoming"),],
   			"Montana" = FM[which(FM[['State']] == "Montana"),]
    				 )
  })

	output$view <- renderGvis({
		gvisMap(ind(), "LatLong", "Marks", options=list(showTip=TRUE, showLine=FALSE, enableScrollWheel=TRUE, mapType='hybrid', useMapTypeControl=TRUE, width=700,height=500))
		#plot(M)
	 })
})








