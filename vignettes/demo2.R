library(Seurat)
library(dplyr)

pbmc_small <- SeuratObject::pbmc_small
pbmc_small <- UpdateSeuratObject(object = pbmc_small)

# Run the demo
pbmc_small %>%
  subset(subset = nFeature_RNA > 20 & nFeature_RNA < 250) %>%
  NormalizeData(scale.factor = 10000) %>%
  FindVariableFeatures(nfeatures = 600) %>%
  SCTransform() %>%
  Unravel::unravel()
