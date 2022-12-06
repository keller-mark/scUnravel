library(Seurat)

# Load example dataset
pbmc.data <- Read10X(data.dir = file.path("data", "seurat", "filtered_gene_bc_matrices", "hg19"))

# Process example dataset (run PCA and cluster)
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k", min.cells = 3, min.features = 200)

pbmc[["percent.mt"]] <- PercentageFeatureSet(pbmc, pattern = "^MT-")

# Load scUnravel
devtools::load_all()

pbmc[1:5000, 1:800] %>%
  NormalizeData(scale.factor = 10000) %>%
  FindVariableFeatures(nfeatures = 600) %>%
  SCTransform() %>%
  unravel()
