setwd("~/UNI/2022-01/CE092/Seminário")

library(readr)
library(WaveletComp)
library(astsa)

da1 <- read.csv("PETR4 Dados Historicos (1).csv", 
                header = T, sep = ";", dec = ",")
names(da1)

da2 <- read.csv("ITSA4 Dados Historicos (1).csv", header = T, sep = ";", dec = ",")
names(da2)

petr4 <- da1$Maxima
itsa4 <- da2$Maxima

# Selecionar o valor maximo de cada ?
# Serie 01/01/2012 a 01/11/2018.
#dados <- data.frame(petr4 = petr4, itsa4 = itsa4)
#head(dados)
#ts.plot(ts(itsa4, start(2012, 1)))

ts.plot(ts(petr4, start(2012, 1)))

petr4 = periodic.series(start.period = 1, end.period = 12)

data = data.frame(petr4 = petr4) 

my.w = analyze.wavelet(data, "petr4", loess.span = 0, dt = 1, make.pval = T, n.sim = 10)

reconstruct(my.w, plot.waves = F, lwd = c(1,2), legend.coords = "bottomleft")

wt.image(my.w, color.key = "quantile", n.levels = 250, legend.params = list(lab = "wavelet power levels", mar = 4.7))

