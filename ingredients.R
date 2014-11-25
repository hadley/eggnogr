basic <- data.frame(
  quantity = c(2, 3, 0.5, 2, 2, 6, 4) / 2,
  unit = c("", "oz", "tsp", "oz", "oz", "oz", "oz"),
  ingredient = c("large eggs", "granulated sugar", "freshly-grated nutmeg",
    "brandy", "spiced rum", "whole milk", "heavy cream"),
  stringsAsFactors = FALSE
)

variation <- data.frame(
  quantity = c(2, 3, 0.5, 2, 3, 6, 4) / 2,
  unit = c("", "oz", "tsp", "oz", "oz", "oz", "oz"),
  ingredient = c("large eggs", "granulated sugar", "freshly-grated nutmeg",
    "anejo tequila", "sherry", "whole milk", "heavy cream"),
  stringsAsFactors = FALSE
)

scale <- function(ingredients, quantity, unit, nice = TRUE, metric = FALSE) {
  by <- quantity * to_oz(unit) / 10
  if (nice) by <- floor(by)
    
  ingredients$quantity <- ingredients$quantity * by
  
  if (metric) {
    in_oz <- ingredients$unit == "oz"
    ingredients$quantity[in_oz] <- ingredients$quantity[in_oz] * 29.6
    ingredients$unit[in_oz] <- "ml"
    if (nice) {
      ingredients$quantity[in_oz] <- round(ingredients$quantity[in_oz])
    }
  }
  
  ingredients
}

units <- c(
  "serving" = 10,
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
