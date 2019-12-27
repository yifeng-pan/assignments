#Sets the .tex output to source code directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#in inches
h = 3
w = 3

source("bonus_assignment_data.R")

flm = lm(Midterm2 ~ Midterm1)

#a
require(tikzDevice)
  tikz("tikzDevice/1a.tex"
       , width = w
       , height = h
       , standAlone = F)
  
  plot(Midterm1, Midterm2, type = "p"
       , main = "Midterm scores"
       , xlab = "Midterm 1"
       , ylab = "Midterm 2")
  abline(flm) #Line of best fit from part c
dev.off()

#b
corr = cor(Midterm1, Midterm2)
cat("Correlation between midterm 1 and 2 grades: ", corr, '\n')

#c
lse = flm$coefficients
print("Least-squaresestimate: ")
print(lse)

#h
require(tikzDevice)
  tikz("tikzDevice/1h.tex"
       , width = w
       , height = h
       , standAlone = F)
  
  residuals = flm$residuals
  hist(residuals, xlab = "Residuals")
  plot(flm, which = 2)
dev.off()

#i
slope = flm$coefficients[2]
se = summary(flm)$coef[[4]]#Standard error
df = flm$df.residual

t = (slope - 0) / se
pv = 2 * (1 - pt(t, df))
cat("p-value: ", pv, '\n')

#j
ci = confint(flm, level = 0.95)["Midterm1", ]
cat("Confidence interval: ", ci, '\n')