pbmc <- RunUMAP(
  pbmc,
  dims = 1:10
)

DimPlot(
  pbmc,
  reduction = "umap",
  label = TRUE
)
