library(ggplot2)
library(dplyr)
library(grid)
library(reshape2)
source("setup.R", chdir=T)

cols <- c("#A60628", "#348ABD")
specs <- levels(pp$SPEC)[!(levels(pp$SPEC) %in% c("", "UNID"))]
diedCols <- c("DIED", "rDIED")

library(survival)
lifetimes <- c(rexp(25, rate=0.2), rexp(25, rate=0.1))
censtimes <- rep(5 * (1 + runif(25)), 2)
ztimes <- pmin(lifetimes, censtimes)
status <- as.numeric(censtimes > lifetimes)
group <- rep(c(0, 1), each=25)
dat <- data.frame(lifetimes=lifetimes, censtimes=censtimes,
                  ztimes=ztimes, status=status, group=group)
fit <- survfit(Surv(dat$ztimes, dat$status) ~ dat$group, conf.int=.95)
conf <- data.frame(upper=fit$upper, lower=fit$lower, group=dat$group)

library(googleVis)
abbas <- pp[pp$SPEC == "ABBA" & ]
tst <- data.frame(group=)
Motion = gvisMotionChart(dat, idvar="group", timevar="ztimes")
plot(Motion)
