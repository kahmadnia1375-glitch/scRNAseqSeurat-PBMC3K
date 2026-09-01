library(Seurat)

url <- "https://cf.10xgenomics.com/samples/cell-exp/1.1.0/pbmc3k/pbmc3k_filtered_gene_bc_matrices.tar.gz"

download.file(
  url,
  destfile = "pbmc3k.tar.gz",
  mode = "wb"
)

untar("pbmc3k.tar.gz")

data <- Read10X("filtered_gene_bc_matrices/hg19/")

pbmc <- CreateSeuratObject(
  counts = data,
  project = "PBMC3K",
  min.cells = 3,
  min.features = 200
)

pbmc
