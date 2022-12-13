load_data <- function() {
  pbmc.data <- Read10X(data.dir = file.path("data", "seurat", "filtered_gene_bc_matrices", "hg19"))
  pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k", min.cells = 3, min.features = 200)
  pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern = "^MT-")
  pbmc <- Seurat::ScaleData(pbmc, do.scale = FALSE, do.center = FALSE)
  return(pbmc[1:2000, 1:700])
}

load_simulated_data_a <- function() {
  set.seed(11)
  sim.groups <- splatter::splatSimulate(group.prob = c(0.4, 0.3, 0.3), method = "groups", verbose = FALSE)
  sim.groups <- scater::logNormCounts(sim.groups)
  sim.seurat <- Seurat::as.Seurat(sim.groups, counts = "counts", data = "logcounts")
  sim.seurat <- SeuratObject::RenameAssays(sim.seurat, originalexp = "RNA")
  sim.seurat <- Seurat::ScaleData(sim.seurat, do.scale = FALSE, do.center = FALSE)
  return(sim.seurat[1:1100, 1:100])
}

load_simulated_data_b <- function() {
  set.seed(22)
  sim.groups <- splatter::splatSimulate(group.prob = c(0.3, 0.3, 0.4), method = "groups", verbose = FALSE)
  sim.groups <- scater::logNormCounts(sim.groups)
  sim.seurat <- Seurat::as.Seurat(sim.groups, counts = "counts", data = "logcounts")
  sim.seurat <- SeuratObject::RenameAssays(sim.seurat, originalexp = "RNA")
  sim.seurat <- Seurat::ScaleData(sim.seurat, do.scale = FALSE, do.center = FALSE)
  return(sim.seurat[1:1100, 1:100])
}
load_simulated_data_c <- function() {
  set.seed(33)
  sim.groups <- splatter::splatSimulate(group.prob = c(0.4, 0.3, 0.3), method = "groups", verbose = FALSE)
  sim.groups <- scater::logNormCounts(sim.groups)
  sim.seurat <- Seurat::as.Seurat(sim.groups, counts = "counts", data = "logcounts")
  sim.seurat <- SeuratObject::RenameAssays(sim.seurat, originalexp = "RNA")
  sim.seurat <- Seurat::ScaleData(sim.seurat, do.scale = FALSE, do.center = FALSE)
  return(sim.seurat[1:1100, 1:100])
}

load_simulated_data_d <- function() {
  set.seed(44)
  sim.groups <- splatter::splatSimulate(group.prob = c(0.3, 0.3, 0.4), method = "groups", verbose = FALSE)
  sim.groups <- scater::logNormCounts(sim.groups)
  sim.seurat <- Seurat::as.Seurat(sim.groups, counts = "counts", data = "logcounts")
  sim.seurat <- SeuratObject::RenameAssays(sim.seurat, originalexp = "RNA")
  sim.seurat <- Seurat::ScaleData(sim.seurat, do.scale = FALSE, do.center = FALSE)
  return(sim.seurat[1:1100, 1:100])
}
