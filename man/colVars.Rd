% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/colVars.R, R/rowVars.R
\name{colVars,DelayedMatrix-method}
\alias{colVars,DelayedMatrix-method}
\alias{rowVars,DelayedMatrix-method}
\title{Calculates the variance for each row (column) of a matrix-like object}
\usage{
\S4method{colVars}{DelayedMatrix}(
  x,
  rows = NULL,
  cols = NULL,
  na.rm = FALSE,
  center = NULL,
  force_block_processing = FALSE,
  ...,
  useNames = TRUE
)

\S4method{rowVars}{DelayedMatrix}(
  x,
  rows = NULL,
  cols = NULL,
  na.rm = FALSE,
  center = NULL,
  force_block_processing = FALSE,
  ...,
  useNames = TRUE
)
}
\arguments{
\item{x}{A NxK \linkS4class{DelayedMatrix}.}

\item{rows, cols}{A \code{\link{vector}} indicating the subset of rows
(and/or columns) to operate over. If \code{\link{NULL}}, no subsetting is
done.}

\item{na.rm}{If \code{\link[base]{TRUE}}, missing values
(\code{\link[base]{NA}} or \code{\link[base]{NaN}}) are
omitted from the calculations.}

\item{center}{(optional) the center, defaults to the row means.}

\item{force_block_processing}{\code{FALSE} (the default) means that a
seed-aware, optimised method is used (if available). This can be overridden
to use the general block-processing strategy by setting this to \code{TRUE}
(typically not advised). The block-processing strategy loads one or more
(depending on \verb{\link[DelayedArray]\{getAutoBlockSize\}()}) columns (\code{colFoo()})
or rows (\code{rowFoo()}) into memory as an ordinary \link[base:array]{base::array}.}

\item{...}{Additional arguments passed to specific methods.}

\item{useNames}{If \code{\link{TRUE}} (default), names attributes of result are set. Else if \code{\link{FALSE}}, no naming support is done.}
}
\value{
Returns a \code{\link{numeric}} \code{\link{vector}} of length N (K).
}
\description{
Calculates the variance for each row (column) of a matrix-like object.
}
\details{
The S4 methods for \code{x} of type \code{\link{matrix}},
\code{\link{array}}, \code{\link{table}}, or \code{\link{numeric}} call
\code{matrixStats::\link[matrixStats]{rowVars}} /
\code{matrixStats::\link[matrixStats]{colVars}}.
}
\examples{
# A DelayedMatrix with a 'matrix' seed
dm_matrix <- DelayedArray(matrix(c(rep(1L, 5),
                                   as.integer((0:4) ^ 2),
                                   seq(-5L, -1L, 1L)),
                                 ncol = 3))
# A DelayedMatrix with a 'HDF5ArraySeed' seed
# NOTE: Requires that the HDF5Array package is installed
library(HDF5Array)
dm_HDF5 <- writeHDF5Array(matrix(c(rep(1L, 5),
                                   as.integer((0:4) ^ 2),
                                   seq(-5L, -1L, 1L)),
                                 ncol = 3))

colVars(dm_matrix)

rowVars(dm_matrix)
}
\seealso{
\itemize{
\item \code{matrixStats::\link[matrixStats]{rowVars}()} and
\code{matrixStats::\link[matrixStats:rowVars]{colVars}()} which are used
when the input is a \code{matrix} or \code{numeric} vector.
\item For mean estimates, see \code{\link[MatrixGenerics]{rowMeans2}()} and
\code{\link[base:colSums]{rowMeans}()}.
\item For standard deviation estimates, see \code{\link[MatrixGenerics]{rowSds}()}.
\item \code{stats::\link[stats:cor]{var}()}.
}
}
\author{
Peter Hickey
}
