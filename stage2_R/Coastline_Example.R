# Coastline example

library(ggplot2)
library(ggridges)
library(mapproj)

setwd("~/TransectFolder")

Catalina <- read.csv(file="Catalina_transects.csv", header=TRUE, sep=",")

names(Catalina)[1] <- "Elev"
names(Catalina)[2] <- "Lon"
names(Catalina)[3] <- "Lat"

Catalina_Water <- ggplot(Catalina, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 4, fill="slateblue4", color = "white", size = .75) +
  scale_x_continuous(name = "CATALINA ISLAND")  +
  ylim(33.29, 33.5) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "slateblue1"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "slateblue1"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'white', size = 24)) + 
  coord_map()  
Catalina_Water
ggsave("Catalina_Water.png")

Catalina_NoWater <- Catalina

Catalina_NoWater$Elev[Catalina_NoWater$Elev <= 0] <- NA

Catalina_NoWater <- ggplot(Catalina_coastline, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 4, fill="slateblue4", color = "white") +
  scale_x_continuous(name = "CATALINA ISLAND")  +
  ylim(33.29, 33.5) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "slateblue1"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "slateblue1"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'white', size = 24)) + 
  coord_map()
Catalina_NoWater
ggsave("Catalina_NoWater.png")

