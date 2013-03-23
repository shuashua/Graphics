setwd("/Users/shuhualiang/Documents/Davis MS/STA 242/Final")

library(RgoogleMaps)
library(shiny)
library(googleVis)
library(maps)

FM = read.csv("/Users/shuhualiang/Documents/Davis MS/STA 242/Final/FM.csv")

names(FM)[names(FM)=="x"] = "lon"
names(FM)[names(FM)=="y"] = "lat"

### Check simple data:
sapply(FM, class)
names(FM)
length(FM[[1]])

data = FM[-which(FM$State == "Alaska"),]

delete = unique(c(which(data$lon < -124.77), which(data$lon > -66.95), which(data$lat < 24.52), which(data$lat > 49.38)))

data = data[-delete,]

### Plot all FM on map: 
lat=data$lat; lon=data$lon
center = c(lat=mean(lat, na.rm=TRUE), lon=mean(lon, na.rm=TRUE))
zoom <- min(MaxZoom(latrange=range(lat, na.rm=TRUE), lonrange=range(lon, na.rm=TRUE)))

myMap = GetMap(center=center, zoom=zoom, maptype="stallite", destfile="USA.png", size=c(450, 300))

PlotOnStaticMap(myMap, lat = lat, lon = lon, axes = FALSE, mar = rep(4, 4), pch=".", col="red", main="Locations of Farmers' Markets")

### Plot FM counts on map:
FMcounts_states = data.frame(table(FM$State))
names(FMcounts_states)[names(FMcounts_states)=='Freq'] = 'Farmers Markets Counts'

G1 <- gvisGeoMap(FMcounts_states, locationvar='Var1', numvar='Farmers Markets Counts', options=list(region='US')) 

plot(G1)












