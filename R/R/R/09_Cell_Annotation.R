library(Seurat)
library(dplyr)

markers <- FindAllMarkers(
  pbmc,
  only.pos = TRUE,
  min.pct = 0.25,
  logfc.threshold = 0.25
)

celltype_annotations <- c(
  "0" = "Naive/Memory T cells",
  "1" = "Classical monocytes",
  "2" = "CD4 T cells",
  "3" = "B cells",
  "4" = "CD8 T cells",
  "5" = "FCGR3A+ monocytes",
  "6" = "NK cells",
  "7" = "CD1C+ dendritic cells",
  "8" = "Platelets"
)

pbmc <- RenameIdents(
  pbmc,
  celltype_annotations
)

pbmc$cell_type <- Idents(pbmc)

DimPlot(
  pbmc,
  reduction = "umap",
  group.by = "cell_type",
  label = TRUE,
  repel = TRUE
)
