pbmc <- RunPCA(
  pbmc,
  features = VariableFeatures(pbmc)
)

print(pbmc[["pca"]])
