library(Seurat)
library(dplyr)

# Load example dataset
pbmc.data <- Read10X(data.dir = file.path("data", "seurat", "filtered_gene_bc_matrices", "hg19"))
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k", min.cells = 3, min.features = 200)
pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern = "^MT-")

# Run the demo
pbmc[1:2000, 1:700] %>%
  subset(subset = percent.mt < 5) %>%
  NormalizeData(scale.factor = 10000) %>%
  FindVariableFeatures(nfeatures = 600) %>%
  SCTransform() %>%
  Unravel::unravel()
