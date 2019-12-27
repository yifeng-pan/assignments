#Sets the .tex output to source code directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#in inches
h = 3
w = 3

source("bonus_assignment_data.R")

flm = lm(Salary ~ Years)

#a
cod = cor(Salary, Years)^2
cat("Coefficient of determination: ", cod, '\n')

#b
print(flm$coefficients)

#g
require(tikzDevice)
  tikz("tikzDevice/2g.tex"
       , width = w
       , height = h
       , standAlone = F)
  
  residuals = flm$residuals
  hist(residuals, xlab = "Residuals")
  #plot(flm, which = 1)
  plot(flm, which = 2)
dev.off()