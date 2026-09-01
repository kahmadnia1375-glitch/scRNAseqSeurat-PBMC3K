pbmc <- FindNeighbors(
  pbmc,
  dims = 1:10
)

pbmc <- FindClusters(
  pbmc,
  resolution = 0.5
)

table(Idents(pbmc))
