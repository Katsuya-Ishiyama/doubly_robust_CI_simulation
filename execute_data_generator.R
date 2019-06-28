#----------------------------------------------------------------------------
# Generating the dataset used in the simulation of Funk et al.(2011).
#
# Generated datasets will be saved in "~/doubly_robust_CI_simulation/data".
#----------------------------------------------------------------------------

source("utils/generator.R")

sample.sizes <- c(100, 500, 1000, 2000)

for (size in sample.sizes) {
  simulation.data <- GenerateSimulationData(size)
  filepath <- paste("data/doubly_robust_simulation_size_", size, ".csv", sep = "")
  write.csv(simulation.data, filepath, row.names = FALSE, quote = FALSE)
}
