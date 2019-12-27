#P4
July = c(153.3, 155.9, 176.2, 189.9, 200.0, 214.9, 
         229.9, 231.5, 257.9, 299.9)
January = c(151.1, 154.2, 169.9, 169.9, 185.9, 199.5, 
            229.9, 232.9, 279.9, 289.9)  

#Variance are equal
var4 = var.test(July, January, alternative = "greater")$conf.int

pv4a = t.test(July, January, var.equal = T,
              alternative = "greater", conf.level = 0.95)$p.value

pv4b = 1 - pt(mean(July - January)
              / sqrt( (var(July) + var(January)) / 2 ) 
              / sqrt(2 / 10), 18)

cat("p-value for p4, first method: ", pv4a, '\n')
cat("p-value for p4, second method: ", pv4b, '\n')

#P5
library(EnvStats)
p5 = c(351.4, 351, 351.9, 350.3)
pv5 = varTest(p5, alternative = "less", conf.level = 0.93)$p.value
cat("p-value for p5: ", pv5, '\n')