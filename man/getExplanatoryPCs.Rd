% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getExplanatoryPCs.R
\name{getExplanatoryPCs}
\alias{getExplanatoryPCs}
\title{Per-PC variance explained by a variable}
\usage{
getExplanatoryPCs(x, dimred = "PCA", n_dimred = 10, ...)
}
\arguments{
\item{x}{A \linkS4class{SingleCellExperiment} object containing dimensionality reduction results.}

\item{dimred}{String or integer scalar specifying the field in \code{reducedDims(x)} that contains the PCA results.}

\item{n_dimred}{Integer scalar specifying the number of the top principal components to use.}

\item{...}{Additional arguments passed to \code{\link{getVarianceExplained}}.}
}
\value{
A matrix containing the percentage of variance explained by each factor (column) and for each PC (row).
}
\description{
Compute, for each principal component, the percentage of variance that is explained by one or more variables of interest.
}
\details{
This function computes the percentage of variance in PC scores that is explained by variables in the sample-level metadata.
It allows identification of important PCs that are driven by known experimental conditions, e.g., treatment, disease.
PCs correlated with technical factors (e.g., batch effects, library size) can also be detected and removed prior to further analysis.

By default, the function will attempt to use pre-computed PCA results in \code{object}.
This is done by taking the top \code{n_dimred} PCs from the matrix specified by \code{dimred}.
If these are not available or if \code{rerun=TRUE}, the function will rerun the PCA using \code{\link{runPCA}};
however, this mode is deprecated and users are advised to explicitly call \code{runPCA} themselves.
}
\examples{
example_sce <- mockSCE()
example_sce <- logNormCounts(example_sce)
example_sce <- runPCA(example_sce)

r2mat <- getExplanatoryPCs(example_sce)

}
\seealso{
\code{\link{plotExplanatoryPCs}}, to plot the results.

\code{\link{getVarianceExplained}}, to compute the variance explained.
}
\author{
Aaron Lun
}
