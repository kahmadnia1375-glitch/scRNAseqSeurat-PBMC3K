library(Seurat)
library(dplyr)

top_markers <- deg %>%
  group_by(cluster) %>%
  slice_max(
    order_by = avg_log2FC,
    n = 5
  )

DoHeatmap(
  pbmc,
  features = top_markers$gene,
  group.by = "cell_type"
)
