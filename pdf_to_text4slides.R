library(pdftools)
library(tidyverse)
library(stringr)

file_vector <- list.files(path = "data")

ndl_06 <- pdf_text(paste0("data/", file_vector))
View(ndl_06)

ndl_06 <- paste0(ndl_06, "\n")

ndl_06_split <- ndl_06 %>% strsplit(split = "\n")

for (i in 1:length(ndl_06_split)) {
  ndl_06_split[[i]][1] <- paste0("## ", ndl_06_split[[i]][1])
}

for (i in 1:length(ndl_06_split)) {
  ndl_06_split[[i]] <- str_replace(ndl_06_split[[i]], "• ", "- ")
}

lapply(ndl_06_split, write, "outfile.txt", append = TRUE)