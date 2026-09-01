pbmc <- FindVariableFeatures(
  pbmc,
  selection.method = "vst",
  nfeatures = 2000
)

top10 <- head(VariableFeatures(pbmc), 10)
top10
