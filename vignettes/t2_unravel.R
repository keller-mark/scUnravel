library(Seurat)
library(magrittr)
source(file.path(getwd(), "vignettes", "helpers.R"))

# Step 1. Load example dataset
sim <- load_simulated_data_b()
# Step 2. Analyze the data
sim %>%
  NormalizeData(scale.factor = 1000) %>%
  FindVariableFeatures(nfeatures = 50) %>%
  SCTransform() %>%
  Unravel::unravel()
