### ============================================================================
### colSdDiffs
###

### ----------------------------------------------------------------------------
### Non-exported methods
###

#' `colSdDiffs()` block-processing internal helper
#' @inherit matrixStats::colSdDiffs
#' @importFrom methods is
.DelayedMatrix_block_colSdDiffs <- function(x, rows = NULL, cols = NULL,
                                            na.rm = FALSE, diff = 1L,
                                            trim = 0, ...) {
  # Check input type
  stopifnot(is(x, "DelayedMatrix"))
  stopifnot(!x@is_transposed)
  DelayedArray:::.get_ans_type(x)

  # Subset
  x <- ..subset(x, rows, cols)

  # Compute result
  val <- DelayedArray:::colblock_APPLY(x = x,
                                       APPLY = matrixStats::colSdDiffs,
                                       na.rm = na.rm,
                                       diff = diff,
                                       trim = trim,
                                       ...)
  if (length(val) == 0L) {
    return(numeric(ncol(x)))
  }
  # NOTE: Return value of matrixStats::colSdDiffs() has names
  unlist(val, recursive = FALSE, use.names = TRUE)
}

### ----------------------------------------------------------------------------
### Exported methods
###

# ------------------------------------------------------------------------------
# General method
#

#' @importFrom DelayedArray seed
#' @importFrom methods hasMethod is
#' @rdname colSdDiffs
#' @template common_params
#' @export
setMethod("colSdDiffs", "DelayedMatrix",
          function(x, rows = NULL, cols = NULL, na.rm = FALSE, diff = 1L,
                   trim = 0, force_block_processing = FALSE, ...) {
            if (!hasMethod("colSdDiffs", class(seed(x))) ||
                force_block_processing) {
              message2("Block processing", get_verbose())
              return(.DelayedMatrix_block_colSdDiffs(x = x,
                                                     rows = rows,
                                                     cols = cols,
                                                     na.rm = na.rm,
                                                     diff = diff,
                                                     trim = trim,
                                                     ...))
            }

            message2("Has seed-aware method", get_verbose())
            if (DelayedArray:::is_pristine(x)) {
              message2("Pristine", get_verbose())
              simple_seed_x <- seed(x)
            } else {
              message2("Coercing to seed class", get_verbose())
              # TODO: do_transpose trick
              simple_seed_x <- try(from_DelayedArray_to_simple_seed_class(x),
                                   silent = TRUE)
              if (is(simple_seed_x, "try-error")) {
                message2("Unable to coerce to seed class", get_verbose())
                return(colSdDiffs(x = x,
                                  rows = rows,
                                  cols = cols,
                                  na.rm = na.rm,
                                  diff = diff,
                                  trim = trim,
                                  force_block_processing = TRUE,
                                  ...))
              }
            }

            colSdDiffs(x = simple_seed_x,
                       rows = rows,
                       cols = cols,
                       na.rm = na.rm,
                       diff = diff,
                       trim = trim,
                       ...)
          }
)

# ------------------------------------------------------------------------------
# Seed-aware methods
#

#' @importFrom methods setMethod
#' @export
setMethod("colSdDiffs", "matrix", matrixStats::colSdDiffs)