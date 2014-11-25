library("dplyr")

basic <- data_frame(
  quantity = c(2, 3, 0.5, 2, 2, 6, 4) / 2,
  unit = c("", "oz", "tsp", "oz", "oz", "oz", "oz"),
  ingredient = c("large eggs", "granulated sugar", "freshly-grated nutmeg",
    "brandy", "spiced rum", "whole milk", "heavy cream")
)

variation <- data_frame(
  quantity = c(2, 3, 0.5, 2, 3, 6, 4) / 2,
  unit = c("", "oz", "tsp", "oz", "oz", "oz", "oz"),
  ingredient = c("large eggs", "granulated sugar", "freshly-grated nutmeg",
    "anejo tequila", "sherry", "whole milk", "heavy cream")
)

scale <- function(ingredients, quantity, unit) {
  by <- quantity * to_oz(unit) / serving_oz
    
  ingredients %>% mutate(
    quantity = quantity * by
  ) %>% as.data.frame()
}

serving_oz <- sum(ingredients$vol, na.rm = TRUE)
units <- c(
  "serving" = serving_oz,
  "oz" = 1,
  "cup" = 8,
  "quart" = 32,
  "gallon" = 128
)

to_oz <- function(unit) {
  units[[unit]]
}
from_oz <- function(unit) {
  1 / units[[unit]]
}
