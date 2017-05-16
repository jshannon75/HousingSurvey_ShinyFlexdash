library(rgdal)
library(sp)
library(spatialEco)
library(tidyverse)

#Read in data
hexbins<-readOGR("Data","hexgrid_sample")
parcel_points <- read_csv("Data/Parcels_sample.csv")

#Create HexID
hexnum<-1:nrow(hexbins)
hexbins<-cbind(hexbins,hexnum)
hexbins<-hexbins[,5]
names(hexbins)<-"hexID"
hexbins<-spTransform(hexbins, CRS("+init=epsg:4326"))
writeOGR(hexbins,".","hexgrid_sample_ID",driver="ESRI Shapefile")

#Make points spatial and set CRS
coordinates(parcel_points)<-~long+lat
proj4string(parcel_points)<-CRS("+init=epsg:4326")

#Join points to hex grid and aggregate
pointhex<-data.frame(point.in.poly(parcel_points,hexbins))

pointhex_tally<-pointhex[,c(1,7:38,47)] %>% 
  gather(key=var,value=value,-ID,-hexID) %>%
  group_by(hexID,var) %>%
  summarise(count=n(),
            var_value=sum(value=="Yes"))

pointhex_tally$var_value_pct<-round(pointhex_tally$var_value/pointhex_tally$count*100,0)

pointhex_wide<-pointhex_tally[,c(1,2,3,5)] %>% spread(var,var_value_pct)

write_csv(pointhex_wide,"HexCount_sampledata.csv")
