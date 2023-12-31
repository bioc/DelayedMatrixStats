### ============================================================================
### colDiffs
###

### ----------------------------------------------------------------------------
### Non-exported methods
###

.DelayedMatrix_block_colDiffs <- function(x, rows = NULL, cols = NULL, lag = 1L,
                                          differences = 1L,
                                          ..., useNames = TRUE) {
  # Check input type
  stopifnot(is(x, "DelayedMatrix"))
  DelayedArray:::.get_ans_type(x, must.be.numeric = TRUE)

  # Subset
  x <- ..subset(x, rows, cols)

  # Compute result
  val <- colblock_APPLY(x = x,
                        FUN = colDiffs,
                        lag = lag,
                        differences = differences,
                        ...,
                        useNames = useNames)
  if (length(val) == 0L) {
    return(numeric(ncol(x)))
  }
  val <- do.call(cbind, val)
  if (!useNames) {
    val <- unname(val)
  }
  val
}


### ----------------------------------------------------------------------------
### Exported methods
###

# ------------------------------------------------------------------------------
# General method
#

#' @inherit MatrixGenerics::colDiffs
#' @importMethodsFrom DelayedArray seed
#' @rdname colDiffs
#' @template common_params
#' @template lowercase_x
#' @export
#' @template example_dm_matrix
#' @template example_dm_HDF5
#' @author Peter Hickey
#' @examples
#'
#' colDiffs(dm_matrix)
setMethod("colDiffs", "DelayedMatrix",
          function(x, rows = NULL, cols = NULL, lag = 1L, differences = 1L,
                   force_block_processing = FALSE, ..., useNames = TRUE) {
            .smart_seed_dispatcher(x, generic = MatrixGenerics::colDiffs,
                                   blockfun = .DelayedMatrix_block_colDiffs,
                                   force_block_processing = force_block_processing,
                                   rows = rows,
                                   cols = cols,
                                   lag = lag,
                                   differences = differences,
                                   ...,
                                   useNames = useNames)
          }
)
