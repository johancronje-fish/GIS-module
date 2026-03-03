res <- "0003331-260225131425191"

centrarchidae<- occ_download_get(res) %>% occ_download_import() %>% 
  filter(family == 'Centrarchidae') 

centrarchidae<- st_as_sf(centrarchidae, coords = c('decimalLongitude','decimalLatitude'), crs =4326)


class(centrarchidae)

#creating a random pallete

pal <- sample(rainbow(100),4)

leaflet() %>%
  addTiles(group = 'specificEpithet') %>%
  addCircleMarkers(data =  centrarchidae,
                   group =c("macrochirus","dolomieu",'punctulatus','salmoides'),
                   radius = 0.5,
                   color = pal,
                   opacity =1) %>%
  addLegend(position = "topleft",
            color=pal,
            labels = c("Bluegill","Smallmouth Bass",'Spotted Bass','Largemouth Bass (Florida var.)'))


