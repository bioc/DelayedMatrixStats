\name{NEWS}
\title{News for Package \pkg{DelayedMatrixStats}}
\encoding{UTF-8}

\section{Version 1.27}{\itemize{
  \item Remove \code{colAnyMissings()} and \code{rowAnyMissings()}, which were deprecated in Version 1.23 and made defunct in Version 1.25.
}}

\section{Version 1.25}{\itemize{
  \item \code{colAnyMissings()} and \code{rowAnyMissings()} are defunct in favour of the long-recommended \code{colAnyNAs()} and \code{rowAnyNAs()}. These defunct functions will be removed in the next release cycle.
  \item Scalar center argument for matrix functions are now defunct following similar change in \pkg{matrixStats} (\url{https://github.com/HenrikBengtsson/matrixStats/issues/254}).
}}

\section{Version 1.23}{\itemize{
  \item \code{colAnyMissings()} and \code{rowAnyMissings()} are deprecated in favour of the long-recommended \code{colAnyNAs()} and \code{rowAnyNAs()}. These deprecated functions will be made defunct in the next release cycle.
}}

\section{Version 1.14.0}{\itemize{
  \item Fix for missing \code{na.rm=} argument in \code{*AvgsPer*Set} functions.
  \item \pkg{DelayedMatrixStats} no longer has a hard requirement on \pkg{HDF5Array} or \pkg{BiocParallel}.
  \item Correct handling of \code{drop=} by quantile functions (\url{https://github.com/PeteHaitch/DelayedMatrixStats/pull/71}).
  \item Fix 2 issues with how the \code{center} argument is handled (\url{https://github.com/PeteHaitch/DelayedMatrixStats/pull/69}).
}}

\section{Version 1.12.0}{\itemize{
  \item Dispatch to \pkg{sparseMatrixStats} for sparse seeds that do not have their own methods (\url{https://github.com/PeteHaitch/DelayedMatrixStats/pull/65}).
  \item Fix \code{center=} handling for all affected functions (\url{https://github.com/PeteHaitch/DelayedMatrixStats/pull/65}).
  \item \pkg{DelayedMatrixStats} now imports the generics from \pkg{MatrixGenerics}. Thanks to Aaron Lun resolving this (\url{https://github.com/PeteHaitch/DelayedMatrixStats/pull/62}).
}}

\section{Version 1.5.1}{\itemize{
  \item Move \code{rowsum()} and \code{colsum()} to \pkg{DelayedArray} package (\url{https://github.com/PeteHaitch/DelayedMatrixStats/pull/56}).
}}

\section{Version 1.3.9}{\itemize{
  \item Fix bug in \code{rowsum()} reported by @MalteThodberg (\url{https://github.com/PeteHaitch/DelayedMatrixStats/issues/54}).
}}

\section{Version 1.3.6}{\itemize{
  \item Add \code{rowsum()} (based on \code{base::rowsum()}) and \code{colsum()} (not found in base R or \pkg{matrixStats}).
}}

\section{Version 1.1.9}{\itemize{
  \item Sync API with \pkg{matrixStats} \code{v0.53.1}.
  \itemize{
    \item Add explicit arguments to \code{col-/rowSds()}.
    \item Fix dimnames for \code{col-/rowQuantiles()}.
  }
  \item Sync documentation with \pkg{matrixStats} \code{v0.53.1}.
}}

\section{Version 1.1.7}{\itemize{
  \item Add \code{colWeightedSds()}, \code{colWeightedVars()}, \code{rowWeightedSds()},  and \code{rowWeightedVars()}.
}}

\section{Version 1.1.6}{\itemize{
  \item Add \code{colAvgsPerRowSet()}.
}}

\section{Version 1.1.5}{\itemize{
  \item Defunct argument \code{centers} for \code{colMads()}/\code{rowMads()} as of \pkg{matrixStats} \code{v0.53.0}.
  \item Sync documentation with \pkg{matrixStats} \code{v0.53.0}.
}}

\section{Version 0.99.2}{\itemize{
  \item Fix typos in vignette.
  \item Allow vignette code chunks to error if they use functions from \pkg{profmem} (these only work if R was configured with support for memory-profiling, which isn't enabled on Bioconductor's malbec1 Linux machine).
  \item Update API table in README and vignette.
}}

\section{Version 0.99.1}{\itemize{
  \item Develop against the current CRAN release of \pkg{matrixStats} instead of devel version.
  \item Remove \code{colAvgsPerRowSet()} until next CRAN release of \pkg{matrixStats} (\url{https://github.com/HenrikBengtsson/matrixStats/issues/110}).
}}

\section{Version 0.99.0}{\itemize{
  \item Initial submission to Bioconductor.
}}
