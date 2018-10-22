#
# Shawn Schwartz <shawnschwartz@ucla.edu>
#

# import libraries
library(tidyverse)
library(dplyr)
library(magick)


# set working directory
setwd("~/Developer/machine_learning_fishes")


# read in data files (csvs)
Labrdae <- read.csv(file = "_workingData-Labridae/twoClusters.csv", header = TRUE)

fnames <- list.files(path = "_workingData-Labridae/", pattern = "*.csv")

names <- sub(pattern = ".csv", replacement = "", x = fnames)

for(name in names) {
  fp <- file.path("_workingData-Labridae/", paste(name, ".csv", sep=""))
  assign(name, read.csv(file = fp, header = TRUE))
}



# sample random rows from each cluster
#randoms <- sample_n(twoClusters$filepath, 10)



head(twoClusters)

num_Clusters <- 3
num_Rands <- 10
len <- num_Clusters * num_Rands

#twoClusters %>% filter(cluster == 0)
groupedClusts <- threeClusters %>% group_by(cluster)
selectedRands <- sample_n(groupedClusts, num_Rands)
newData <- selectedRands$filepath

#total_img <- tibble()

for(i in 1:len) {
  total_img <- c(total_img, assign(paste("a", i, sep = ""), imgRead <- image_read(toString(newData[i]))))
}

#image_annotate(a1, "I like R!", size = 70, gravity = "southwest", color = "green")



total_img <- image_scale(total_img, "300x300")
image_info(total_img)

image_append(image_scale(total_img, "200"), stack = TRUE)

#print(total_img)
#save.image(file="fish.jpg")



# FishOutput <- read.csv(file = "fish_predictions_output-working.csv", header = TRUE)
#head(FishOutput)


#FishOutput %>% filter(cluster ==6) %>% distinct(family)
#FishOutput %>% distinct(family)
#FishOutput %>% group_by(cluster) %>% summarise(num_fams = n_distinct(family)) 
#FishOutput %>% group_by(cluster) %>% summarise(distinct(family)) 

#bigdata <- image_read('https://jeroen.github.io/images/bigdata.jpg')
#frink <- image_read("https://jeroen.github.io/images/frink.png")
#logo <- image_read("https://jeroen.github.io/images/Rlogo.png")
#img <- c(bigdata, logo, frink)
#img <- image_scale(img, "300x300")
#image_info(img)

#image_append(image_scale(img, "100"), stack = FALSE)

