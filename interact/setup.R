## source("~/work/ecodatascripts/vars/heights/canopy/load_canopy.R")
## require(plyr)
require(dplyr)
require(ggplot2)

if (!file.exists("temp"))
    dir.create("temp")  # store neighbor matrices
if (!file.exists("temp/pp.rds") |
    !file.exists("temp/tp.rds")) {
    source("remake.R")
} else {
    pp <- readRDS("temp/pp.rds")
    tp <- readRDS("temp/tp.rds")
}
