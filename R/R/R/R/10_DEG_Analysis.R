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
