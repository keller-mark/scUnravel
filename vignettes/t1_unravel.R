library(Seurat)
library(magrittr)
source(file.path(getwd(), "vignettes", "helpers.R"))

# Step 1. Load example dataset
pbmc <- load_data()
# Step 2. Analyze the data
devtools::load_all()
pbmc %>%
  subset(subset = percent.mt < 5) %>%
  NormalizeData(scale.factor = 10000) %>%
  FindVariableFeatures(nfeatures = 300) %>%
  SCTransform() %>%
  Unravel::unravel()
