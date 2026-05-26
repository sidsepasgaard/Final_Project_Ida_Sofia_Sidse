install.packages("leaflet")
library(leaflet)
library(htmlwidgets)
library(htmltools)
library(tidyverse)
l_dk <- leaflet() %>%
setView(10.85089, 55.2339084, zoom = 6)
l_dk
esri <- grep("^Esri", providers, value = TRUE)
esri
for (provider in esri) { l_dk <- l_dk %>% addProviderTiles(provider, group = provider)
}
l_dk
DKmap <- l_dk %>%
addLayersControl(names(esri), options = layersControlOptions(collapsed = FALSE)) %>%
addMiniMap(tiles = esri[[1]], toggleDisplay = TRUE, position = "bottomright") %>%
addMeasure(position = "bottomleft", primaryLengthUnit = "meters", primaryAreaUnit = "sqmeters", activeColor = "#3D535D", completedColor = "#7D4479") %>%
htmlwidgets::onRender("function(el,x) { var myMap = this; myMap.on('baselayerchange', function (e) { myMap.minimap.changeLayer(L.tileLayer.provider(e.name));})}") %>%
addControl("", position = "topright") %>%
addMarkers(lng = 10.1972487, lat = 56.1538884, popup = "Aros") %>%
addMarkers(lng = 12.384088, lat = 55.6063323, popup = "Arken") %>%
addMarkers(lng = 12.5770834, lat = 55.6900366, popup = "Hirschsprungske") %>%
addMarkers(lng = 10.5882031, lat = 57.7251093, popup = "Skagen") %>%
addMarkers(lng = 9.530325, lat = 55.5007576, popup = "Trapholt")
DKmap
