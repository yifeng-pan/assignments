x = c(5,3,13,2,25,47,2,3,29,7,2,14,32,77,0,9,7,8,5,21,15,6,23,25,1,13,5,52,7,31,17,
      3,14,16,50,20,6,55,10,5,28,1,9,18,20,14,30,66,1,28,13,35,3,13,22,17,62,20,3,20,23,
      20,21,26,9,11,36,11,5,22,33,3,51,7,5,3,23,4,1,21,15,6,33,11,1)
n = 85

library(EnvStats)

mx = mean(x)
sdx = sd(x)
cat("Mean: ", mx, '\n')
cat("SD: ", sdx, '\n')

CImean = t.test(x, alternative = "greater", conf.level = 0.95)$conf.int
cat("Confidence Inteval for mu: (", CImean, ")\n")
#same lower bound as:
#mean(x) - qt(.95, n -1 ) * sd(x)/sqrt(n)