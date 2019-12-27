#Sets the .tex output to source code directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#had to wipe global data to get rid of an error
rm(list=ls())

#in inches
h = 3
w = 3

diameter = trees$Girth#Diameter is mislabeled as girth
height = trees$Height * 12 #feet to inches
volume = trees$Volume * 12^3 #feet to inches

flm = lm(diameter ~ height)

#a
print(flm$coefficients)

#d
slope = flm$coefficients[2]
se = summary(flm)$coef[[4]]#Standard error
df = flm$df.residual

t = (slope - 0) / se
cat("t: ", t, '\n')

#e
pv = 1 - pt(t, df)
cat("p-value: ", pv, '\n')

#f
newdata = data.frame(height = 80*12)
pi = predict(flm, newdata, interval = "confidence")[2:3]
cat("Prediction interval: ", pi, '\n')

#g
cod = cor(height, diameter)^2
cat("Coefficient of determination: ", cod, '\n')

#h
require(tikzDevice)
  tikz("tikzDevice/3h.tex"
       , width = w
       , height = h
       , standAlone = F)
  
  plot(flm, which = 1)
dev.off()