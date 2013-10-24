## Master file to recreate the doug fir hazard dataset from long-bc-derived.csv
## Master data set: "~/work/data/data/long-bc-derived.csv"
## Steps:
## 1) calculate rGR values
## Creates: "~/work/data/data/hazards/hazards-bc-firs.csv"
## Tracks correlated plots in: "~/work/data/data/hazards/corrplots.csv"
source("~/work/rgr/rgr-hazards/fit-rgr3.R")

## 2) add LRS
## Updates "~/work/data/data/hazards/hazards-bc-firs.csv"
source("~/work/data/data-trans/hazards/addColumns/lrs.R")

## 3) add sdp.hazard, si.hazard (stand development and site index classes)
##  Also converts time column from years (79, 81, etc) to numbers 2:7
## Updates "~/work/data/data/hazards/hazards-bc-firs.csv"
source("~/work/data/data-trans/hazards/addColumns/si-sdp-time-classes.R")

## 4) add trees that died back into dataset and create a died column:
##  0 if a tree survived previous period, 1 if it died during the previous period
## Updates "~/work/data/data/hazards/hazards-bc-firs.csv"
source("~/work/data/data-trans/hazards/addColumns/diedColumn.R")

## 5) Make hazard periods and calculates lambda values:
## - Three periods (3-5, 5-6, 6-7)
## Then remove all unnecessary columns
## Creates "~/work/data/data/hazards/hazards-bc-firs-final.csv"
source("~/work/data/data-trans/hazards/make-hazard-periods.R")

## Check that data has rgr, lrs, sdp.hazard (classes), si.hazard (classes),
##  time as numeric, died column (0, 1)
## tst <- read.csv("~/work/data/data/hazards/hazards-bc-firs.csv")
## print(paste0("rgr: ", "rgr" %in% names(tst)))
## print(paste0("lrs: ", "lrs" %in% names(tst)))
## print(c("sdp.hazard: ", paste(unique(tst$sdp.hazard))))
## print(c("si.hazard: ", paste(unique(tst$si.hazard))))
## print(c("time: ", paste(unique(tst$time))))
## table(tst$died)
