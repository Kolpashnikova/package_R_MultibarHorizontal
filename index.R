library(MultibarHorizontal)
library(rjson)
library(jsonlite)

df <- fromJSON("data/reg_results.txt")
MultibarHorizontal(toJSON(df), xax = "Percent explained", yax = "Housework Task")
