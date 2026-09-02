library(Seurat)
library(dplyr)
library(ggplot2)

dir.create("figures", showWarnings = FALSE)

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

top_markers <- deg %>%
  group_by(cluster) %>%
  slice_max(
    order_by = avg_log2FC,
    n = 5
  )

p_heatmap <- DoHeatmap(
  pbmc,
  features = top_markers$gene,
  group.by = "cell_type"
)

ggsave(
  "figures/marker_heatmap.png",
  plot = p_heatmap,
  width = 12,
  height = 8,
  dpi = 300
)

p_dotplot <- DotPlot(
  pbmc,
  features = marker_genes,
  group.by = "cell_type"
) +
  RotatedAxis()

ggsave(
  "figures/marker_dotplot.png",
  plot = p_dotplot,
  width = 12,
  height = 7,
  dpi = 300
)

p_featureplot <- FeaturePlot(
  pbmc,
  features = c(
    "CD14",
    "MS4A1",
    "NKG7",
    "PPBP"
  ),
  reduction = "umap"
)

ggsave(
  "figures/feature_plot.png",
  plot = p_featureplot,
  width = 12,
  height = 9,
  dpi = 300
)
p_umap <- DimPlot(
  pbmc,
  reduction = "umap",
  group.by = "cell_type",
  label = TRUE,
  repel = TRUE
)

ggsave(
  "figures/umap_cell_types.png",
  plot = p_umap,
  width = 10,
  height = 7,
  dpi = 300
)
