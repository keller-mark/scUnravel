library(Seurat)
library(magrittr)
source(file.path(getwd(), "vignettes", "helpers.R"))

# Step 1. Load example dataset
pbmc <- load_data()

# Step 2. Analyze the data
pbmc <- subset(pbmc, subset = percent.mt < 5)
pbmc <- Seurat::NormalizeData(pbmc, scale.factor = 10000)
pbmc <- Seurat::FindVariableFeatures(pbmc, nfeatures = 300)
pbmc <- Seurat::SCTransform(pbmc)

# Step 3. Plot the data
all_genes <- rownames(pbmc)
pbmc <- Seurat::RunPCA(pbmc, features = all_genes)
pbmc <- Seurat::RunUMAP(pbmc, dims = 1:10)
pbmc <- Seurat::RunTSNE(pbmc, dims = 1:10, check_duplicates = FALSE)
Seurat::DimPlot(pbmc, reduction = "pca")
Seurat::DimPlot(pbmc, reduction = "umap")
Seurat::DimPlot(pbmc, reduction = "tsne")
