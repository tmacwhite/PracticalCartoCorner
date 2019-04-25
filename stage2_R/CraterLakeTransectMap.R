# load requisite packages
library(ggplot2)
library(ggridges)
library(mapproj)

# set your working directory
setwd("~/CraterLakeNP")

# Import the Crater Lake transect data
CraterLake_80transects <- read.csv(file="CraterLake_80transects.csv", header=TRUE, sep=",")

# view data frame and change column headers
head(CraterLake_80transects)
names(CraterLake_80transects)[1] <- "Elev"
names(CraterLake_80transects)[2] <- "Lon"
names(CraterLake_80transects)[3] <- "Lat"

# plot the transects with ggplot2 & ggridges by calling the geom_density_ridges function
CraterLake_basic <- ggplot(CraterLake_80transects, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity")

# customize the plot's appearance to mimic the Unknown Pleasures artwork
CraterLake_Joy <- ggplot(CraterLake_80transects, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 15, fill="black", color = "white") +
  
  # set the upper and lower y-axis limits
  ylim(42.77, 43.15) +

  # add a title to the bottom of the plot frame
  scale_x_continuous(name = "CRATER LAKE NATIONAL PARK")  +
  
  # use theme() to customize the background, axis labels, titles, tick marks, etc.
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "black"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "black"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'white', size = 18)) + 
  
  # projects the transect data to a specified PCS
  coord_map()

# Call the transect map variable
CraterLake_Joy

# Save the plot as a PNG or PDF
ggsave("CraterLake_Joy.png", dpi=300)
ggsave("CraterLake_Joy.pdf")


# Customized plot: 
ggplot(CraterLake_transects, aes(x = Lon, y = Lat, group = Lat, height = Elev)) + 
  geom_density_ridges(stat = "identity", scale = 15, fill="pink", color = "violetred4", size = 1, linetype = "12") +
  scale_x_continuous(name = "CRATER LAKE NATIONAL PARK")  +
  ylim(42.77, 43.15) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect(fill = "pink"), axis.line = element_blank(),
        axis.text.x=element_blank(),
        plot.background = element_rect(fill = "pink"),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.title.x = element_text(colour = 'violetred4', size = 18)) + 
  coord_map()


