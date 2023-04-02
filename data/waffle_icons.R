devtools::install_github("liamgilbey/ggwaffle")
library(ggwaffle)
library(emojifont)  
library(tidyverse)
# The deadliest animal in the world
data <- tibble(Animal = rep("1_Mosquito 54%", 54) %>% 
                 c(rep("2_Human 38%", 38)) %>% 
                 c(rep("3_Snake 4%", 4)) %>% 
                 c(rep("4_Sandfly 2%", 2)) %>% 
                 c(rep("5_Dog 1%" , 1)) %>% 
                 c(rep("6_Other species 1%", 1))
              )
waffle_data <- waffle_iron(data, aes_d(group = Animal), rows = 6)  
waffle_data$label = fontawesome("fa-male")

png(file="waffle_icons.png", width = 800, height = 400)
ggplot(waffle_data, aes(x, y, color = group)) + 
  geom_text(aes(label=label), family='fontawesome-webfont', size=7) +
  coord_equal() + 
  scale_color_manual(
    name = NULL,
    values = c("#0072B2", "#56B4E9", "#009E73", "#CC79A7", "#E69F00", "red"),
    labels = c("Mosquito", "Human", "Snake", "Sandfly", "Dog", "Other species"),
  ) +
 
  labs(x=NULL, y = NULL) +
  labs(title = "Number of people killed by animals, 2015") +
  labs(subtitle ="Other species include Kissing bug, Freshwater snail, Scorpion, Tsetse fly, Ascaris roundworm, Tapeworm, Crocodile, Hippopotamus, Elephant, Lion, Bee, Tiger, Jellyfish, Wolf and Shark") +
  labs(caption ="#30DayChartChallenge | Data source: Gates Notes: The blog of Bill Gates (https://quiz.gatesnotes.com/Malaria2016) | Visualization by @fblpalmeira") +
  theme(plot.title = element_text(size=30))+
  theme(plot.subtitle = element_text(size=9.5))+
  theme(plot.caption = element_text(size=10))+
  theme(legend.key.height = unit(2.25, "line")) +
  theme(
    legend.text=element_text(),
    legend.title = element_blank(),
    legend.position = "right",
    legend.key = element_rect(colour = NA, fill = NA)
    )+
  theme_waffle()  
dev.off()

