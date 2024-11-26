#Overlap package

require(overlap)
library(overlap)

#Analyzing the activity pattern
#padrao_atividade.txt: time of records expressed in numbers

atividade<-read.table("padrao_atividade.txt", header=T)
atividade

summary(atividade)

timeRad <- atividade$time * 2*pi
timeRad

atividade_mirim <- timeRad[atividade$specie=="mirim"]
atividade_mirim

summary (atividade_mirim)

range(timeRad)

par(mar = rep(4, 4))

densityPlot(atividade_mirim, main=NULL, extend= NULL, xlab = "Time", ylab = "Density",
            xcenter = 'midnight', lwd=1, lty=1, n.grid=100)

#Overlap of entry and exit times

entradasaida<-read.table("entrada_saida.txt", header=T)
entradasaida

summary(entradasaida)

timeRad2 <- entradasaida$time * 2*pi
timeRad2

entrando <- timeRad2[entradasaida$tipo=="entrando"]
entrando

saindo <- timeRad2[entradasaida$tipo=="saindo"]
saindo

overlapPlot(entrando, saindo,  ylim=c(0, 0.2), las=1,  xcenter = 'midnight', 
            main= NULL, xlab = "Time", ylab = "Density", linecol= c(1, 4))
legend('topleft', legend = c("Entry", "Exit"), lty=c(1,4), col=c(1,4), bty='n')


# Analyzing the uses

#Entering data about the period of each use: "usos.txt"

usos <-read.table("usos.txt", header=T)
usos

usoperiodo <- usos$periodo
usoperiodo 

#Separate each type of use
#inspection
inspecionando<- usoperiodo[usos$tipo=="inspecionando"]
inspecionando

#exploratory/rest
descanso<- usoperiodo[usos$tipo=="descanso"]
descanso

#sleep
dormir<- usoperiodo[usos$tipo=="dormir"]
dormir

#Period of time spent active outside the burrow
fora<-  usoperiodo[usos$tipo=="fora"]
fora

summary (inspecionando)
#Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#0.0000120 0.0001012 0.0003470 0.0006230 0.0009490 0.0032870 

summary (fora)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.07109 0.24767 0.31308 0.36149 0.41873 0.82926


summary(descanso)
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.02173 0.03506 0.04780 0.06811 0.09874 0.16667 

summary(dormir)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#0.1707  0.5813  0.6869  0.6385  0.7523  0.9289



