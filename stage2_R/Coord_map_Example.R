# Coord_map() example

library(ggplot2)
library(ggridges)
library(mapproj)

setwd("~/Examples")

ContinentalUSA <- read.csv(file="ContinentalUSA.csv", header=TRUE, sep=",")

head(ContinentalUSA)
names(ContinentalUSA)[1] <- "Elev"
names(ContinentalUSA)[2] <- "Lon"
names(ContinentalUSA)[3] <- "Lat"

ContinentalUSA$Elev[ContinentalUSA$Elev <= 0] <- NA

USA_coordmap_none <- ggplot(ContinentalUSA, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 3, fill="darkslategray4", color = "white") +
  scale_x_continuous(name = "Continental USA")  +
  ylim(24, 50) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "darkslategray4"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "darkslategray4"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'white', size = 24))
USA_coordmap_none

USA_coordmap_blank <- ggplot(ContinentalUSA, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 3, fill="darkslategray4", color = "white") +
  scale_x_continuous(name = "Continental USA")  +
  ylim(24, 50) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "darkslategray4"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "darkslategray4"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'white', size = 24)) + 
  coord_map()
USA_coordmap_blank

USA_coordmap_AEA <- ggplot(ContinentalUSA, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 3, fill="darkslategray4", color = "white") +
  scale_x_continuous(name = "Continental USA")  +
  ylim(24, 50) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "darkslategray4"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "darkslategray4"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'white', size = 24)) + 
  coord_map("azequalarea", orientation = c(39.8283, -98.5795, 0))
USA_coordmap_AEA

ggsave("USA_coordmap_none.png")
ggsave("USA_coordmap_blank.png")
ggsave("USA_coordmap_AEA.png")
