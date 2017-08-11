# TODO: Per https://github.com/klutometis/roxygen/issues/594 have to include
#       @md tag
#' @md
# #' @param BACKEND "auto" (the default) selects a sensible realization backend
# #' based on `class(x)`. See [DelayedArray::supportedRealizationBackends()] for
# #' the list of supported backends.
#' @param force_block_processing `FALSE` (the default) means that a
#' seed-aware, optimised method is used (if available). This can be overridden
#' to use the general block-processing strategy by setting this to `TRUE`
#' (typically not advised).