library(Seurat)
library(magrittr)
source(file.path(getwd(), "vignettes", "helpers.R"))

# Step 1. Load example dataset
sim <- load_simulated_data_a()

all_genes <- rownames(sim)
sim <- Seurat::RunPCA(sim, features = all_genes)
sim <- Seurat::RunUMAP(sim, dims = 1:10)
sim <- Seurat::RunTSNE(sim, dims = 1:10, check_duplicates = FALSE)
Seurat::DimPlot(sim, reduction = "pca")
Seurat::DimPlot(sim, reduction = "umap")
Seurat::DimPlot(sim, reduction = "tsne")

# Step 2. Analyze the data
sim <- Seurat::FindVariableFeatures(sim, nfeatures = 50)
sim <- Seurat::NormalizeData(sim, scale.factor = 1000)
sim <- Seurat::SCTransform(sim)

# Step 3. Plot the data
sim <- Seurat::RunPCA(sim, features = all_genes)
sim <- Seurat::RunUMAP(sim, dims = 1:10)
sim <- Seurat::RunTSNE(sim, dims = 1:10, check_duplicates = FALSE)
Seurat::DimPlot(sim, reduction = "pca")
Seurat::DimPlot(sim, reduction = "umap")
Seurat::DimPlot(sim, reduction = "tsne")
