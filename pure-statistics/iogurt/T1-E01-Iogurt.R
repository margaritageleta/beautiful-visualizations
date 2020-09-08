setwd("~/Desktop/xperiments/Rii")
dd<-read.csv2("Iogurt.csv") # dd es de dades
head(dd)
library(car)
library(tables)

#====================================================
# (a) Descriptiva

# Gr??fiques
sp(pH~dia,dd)
sp(dia~pH|Ferm,dd,smooth=F)
sp(pH~dia|Ferm,dd,smooth=F) # sp es scatter plot
sp(strep~dia|Ferm,smooth=F,dd)
sp(lactob~dia|Ferm,smooth=F,dd)

# Taules

dd$Fdia<-as.factor(dd$dia)
tabular((pH+strep+lactob)*Ferm*((n=1)+mean+sd)~Fdia,dd) # n = nombre de dades, repliques i li posem el nom de n.
tabular((pH)*Ferm*((n=1)+mean+sd)~Fdia,dd) # n = nombre de dades, repliques i li posem el nom de n.

# o b?? per separat tabular(pH*Ferm*((n=1)+mean+sd)~Fdia,dd) ...

#====================================================
# (b) Comparacions de 2

# pH dia 0
t.test(pH~Ferm,dd[dd$dia==0,]) # test t de dues esperances de variables normals
t.test(pH~Ferm,var.equal=T,dd[dd$dia==0,])
var.test(pH~Ferm,dd[dd$dia==0,])

t.test(lactob~Ferm,dd[dd$dia==21,])
t.test(lactob~Ferm,var.equal=T,dd[dd$dia==21,])

# strep dia 21
t.test(strep~Ferm,dd[dd$dia==21,])
t.test(strep~Ferm,var.equal=T,dd[dd$dia==21,])
var.test(strep~Ferm,dd[dd$dia==21,])


#====================================================
# (c) Predicci?? a partir del pH

#strep
sp(strep~pH|Ferm,dd)
sp(strep~pH|Ferm,dd,smooth=F,boxplot=F)
sp(strep~pH,dd,smooth=F,boxplot=F) # treiem el condicionat a fermentacio, pq hem vist que no depen

(mstrep<-lm(strep~pH,dd)) # quan fem assignacio no escriu res a la consola, per aixo posem en tre parentesis pq ho escrigui en la consola.
summary(mstrep)
# la formula que li hem donat
# els residuals son les distancies que hi ha de cada punt a la recta. Per veure com son els residuals, noescriu tota la llista de residuals. nomesesciur els residuals minim, maxim etc
# intercept es el valor alfa.
# el pH no es el pH, es el coeficient que multiplica el pH, o sigui, es la beta.
# test si lalfa es igual a zero (el test diu que es diferent, ixo vol dir que no pasa per zero)
# test de la beta, no es zero i vol dir que la recta no es horitzontal i el lactob depen del pH.
# Residual standard error vol dir que la desviacio tipus es petita i ajusta be, 
# 18.556 elevat al quadrat el 344.4 (Tstudent vs Fisher), el p-valor es el mateix.
# coeficient de determinacio, si a prop de 1 la relacio es bona (correlacio), si llluny de 1, poca relacio. Aqui el
# coeficient d e determinacio es el mutliple R-squared. Pero no nhi ha prou
# hem der fer ddiagnostics grafics.
# el valor predit es el valor de la recta i el residual es el valor predit menys 

summary(mstrep<-lm(strep~pH,dd))
(lstrep<-mstrep$coef[1]+mstrep$coef[2]*4)
sp(strep~pH,dd,smooth=F,boxplot=F)
abline(v=4,h=lstrep,lt=2)

plot(predict(mstrep),resid(mstrep))
abline(h=0,lt=2)

oldpar <- par(mfrow=c(2,2))
plot(mstrep,ask=F)
par(oldpar) # anula la primera comanda

#lactob
sp(lactob~pH|Ferm,dd,smooth=F,boxplot=F)
sp(lactob~pH,dd,smooth=F,boxplot=F)

summary(mlactob<-lm(lactob~pH,dd))
(llactob<-mlactob$coef[1]+mlactob$coef[2]*4)
sp(lactob~pH,dd,smooth=F,boxplot=F)
abline(v=4,h=llactob,lt=2)

plot(predict(mlactob),resid(mlactob))
abline(h=0,lt=2)

#oldpar <- par(mfrow=c(2,2))
#plot(mlactob,ask=F)
#par(oldpar)

# R2 i lv
summary(mstrep)
summary(mlactob)

c(strep=summary(mstrep)$r.squared,lactob=summary(mlactob)$r.squared)
c(strep=logLik(mstrep),lactob=logLik(mlactob))
