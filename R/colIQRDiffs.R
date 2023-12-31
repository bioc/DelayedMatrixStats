### ============================================================================
### colIQRDiffs
###

### ----------------------------------------------------------------------------
### Non-exported methods
###

.DelayedMatrix_block_colIQRDiffs <- function(x, rows = NULL, cols = NULL,
                                             na.rm = FALSE, diff = 1L,
                                             trim = 0, ..., useNames = TRUE) {
  # Check input type
  stopifnot(is(x, "DelayedMatrix"))
  DelayedArray:::.get_ans_type(x, must.be.numeric = TRUE)

  # Subset
  x <- ..subset(x, rows, cols)

  # Compute result
  val <- colblock_APPLY(x = x,
                        FUN = colIQRDiffs,
                        na.rm = na.rm,
                        diff = diff,
                        trim = trim,
                        ...,
                        useNames = useNames)
  if (length(val) == 0L) {
    return(numeric(ncol(x)))
  }
  unlist(val, recursive = FALSE, use.names = useNames)
}

### ----------------------------------------------------------------------------
### Exported methods
###

# ------------------------------------------------------------------------------
# General method
#

#' @inherit MatrixGenerics::colIQRDiffs
#' @importMethodsFrom DelayedArray seed
#' @rdname colIQRDiffs
#' @template common_params
#' @template lowercase_x
#' @export
#' @template example_dm_MatrixMatrix
#' @template example_dm_Rle
#' @author Peter Hickey
#' @examples
#'
#' colIQRDiffs(dm_Matrix)
setMethod("colIQRDiffs", "DelayedMatrix",
          function(x, rows = NULL, cols = NULL, na.rm = FALSE, diff = 1L,
                   trim = 0, force_block_processing = FALSE, ..., useNames = TRUE) {
            .smart_seed_dispatcher(x, generic = MatrixGenerics::colIQRDiffs,
                                   blockfun = .DelayedMatrix_block_colIQRDiffs,
                                   force_block_processing = force_block_processing,
                                   rows = rows,
                                   cols = cols,
                                   na.rm = na.rm,
                                   diff = diff,
                                   trim = trim,
                                   ...,
                                   useNames = useNames)
          }
)
