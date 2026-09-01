pbmc[["percent.mt"]] <- PercentageFeatureSet(
  pbmc,
  pattern = "^MT-"
)

VlnPlot(
  pbmc,
  features = c("nFeature_RNA", "nCount_RNA", "percent.mt"),
  ncol = 3
)

pbmc <- subset(
  pbmc,
  subset = nFeature_RNA > 200 &
           nFeature_RNA < 2500 &
           percent.mt < 5
)

pbmc
