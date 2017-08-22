### ============================================================================
### rowCounts
###

### ----------------------------------------------------------------------------
### Non-exported methods
###

#' `rowCounts()` block-processing internal helper
#' @inherit matrixStats::rowCounts
#' @importFrom methods is
.DelayedMatrix_block_rowCounts <- function(x, rows = NULL, cols = NULL,
                                           value = TRUE, na.rm = FALSE,
                                           dim. = dim(x), ...) {
  # Check input type
  stopifnot(is(x, "DelayedMatrix"))
  stopifnot(!x@is_transposed)
  DelayedArray:::.get_ans_type(x)

  # Subset
  x <- ..subset(x, rows, cols)

  # Compute result
  val <- rowblock_APPLY(x = x,
                        APPLY = matrixStats::rowCounts,
                        value = value,
                        na.rm = na.rm,
                        ...)
  if (length(val) == 0L) {
    return(numeric(ncol(x)))
  }
  # NOTE: Return value of matrixStats::rowCounts() has no names
  unlist(val, recursive = FALSE, use.names = FALSE)
}

### ----------------------------------------------------------------------------
### Exported methods
###

# ------------------------------------------------------------------------------
# General method
#

#' @importFrom DelayedArray seed
#' @importFrom methods hasMethod is
#' @rdname rowCounts
#' @template common_params
#' @export
setMethod("rowCounts", "DelayedMatrix",
          function(x, rows = NULL, cols = NULL, value = TRUE, na.rm = FALSE,
                   dim. = dim(x), force_block_processing = FALSE, ...) {
            if (!hasMethod("rowCounts", class(seed(x))) ||
                force_block_processing) {
              message2("Block processing", get_verbose())
              return(.DelayedMatrix_block_rowCounts(x = x,
                                                    rows = rows,
                                                    cols = cols,
                                                    value = value,
                                                    na.rm = na.rm,
                                                    dim. = dim.,
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
                return(rowCounts(x = x,
                                 rows = rows,
                                 cols = cols,
                                 value = value,
                                 na.rm = na.rm,
                                 dim. = dim.,
                                 force_block_processing = TRUE,
                                 ...))
              }
            }

            rowCounts(x = simple_seed_x,
                      rows = rows,
                      cols = cols,
                      value = value,
                      na.rm = na.rm,
                      dim. = dim.,
                      ...)
          }
)

# ------------------------------------------------------------------------------
# Seed-aware methods
#

#' @importFrom methods setMethod
#' @export
setMethod("rowCounts", "matrix", matrixStats::rowCounts)