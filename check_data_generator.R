# Check simulation data.
#
# This is the program to check data generator.
#
# Confirming that generator was correctly implemented of
# the Funk et al.(2011), we will use Law of Large Numbers.
# If generator was correctly implemented, the averages of mean of y
# and standard deviation of y were close to 0.3 and 2.3, respectively.
#
# Our checking procedure as follows:
#
#   1. Generate a dataset by "GenerateSimulationData".
#   2. Caluculate mean of y and standard deviation of y.
#   3. Repeat 1 and 2 of 10,000 times.
#   4. Caluculate the averages of means of y and standard deviation of y.
#   5. If correctly implemented, the average of means of y converges to 0.3,
#      and the average of standard deviations of y converges to 2.3.

source("./utils/generator.R")

kNumIterations <- 10000
kSampleSize <- 100

y.mean <- numeric(kNumIterations)
y.sd <- numeric(kNumIterations)

for (sim in 1:kNumIterations) {
  simulation.data <- GenerateSimulationData(size = kSampleSize)
  y.mean[sim] <- mean(simulation.data$y)
  y.sd[sim]   <- sd(simulation.data$y)
}

print(paste("mean(y.mean) =", mean(y.mean), ", SE(y.mean) =", sd(y.mean)))
print(paste("mean(y.sd) =", mean(y.sd), ", SE(y.sd) =", sd(y.sd)))

par(mfrow = c(2, 1))
hist(y.mean)
hist(y.sd)
par(mfrow = c(1, 1))
