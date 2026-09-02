library(Seurat)
library(dplyr)

Idents(pbmc) <- "cell_type"

deg <- FindAllMarkers(
  pbmc,
  only.pos = TRUE,
  min.pct = 0.25,
  logfc.threshold = 0.25
)

deg_top10 <- deg %>%
  group_by(cluster) %>%
  slice_max(
    order_by = avg_log2FC,
    n = 10
  )

deg_top10

write.csv(
  deg_top10,
  "DEG_top10_by_cell_type.csv",
  row.names = FALSE
)
marker_genes <- c(
  "CCR7", "IL7R", "LTB",
  "CD14", "S100A8", "S100A9",
  "MS4A1", "CD79A",
  "CD8A", "CD8B", "CCL5",
  "NKG7", "GNLY", "GZMB",
  "FCGR3A", "LYZ",
  "FCER1A", "CD1C",
  "PF4", "PPBP"
)

DotPlot(
  pbmc,
  features = marker_genes,
  group.by = "cell_type"
) +
  RotatedAxis()
