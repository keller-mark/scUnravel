library(splatter)
library(scater)

set.seed(1)
sim.groups <- splatter::splatSimulate(group.prob = c(0.5, 0.5), method = "groups", verbose = FALSE)
sim.groups <- scater::logNormCounts(sim.groups)
sim.seurat <- Seurat::as.Seurat(sim.groups, counts = "counts", data = "logcounts")
