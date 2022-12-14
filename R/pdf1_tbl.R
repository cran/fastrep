#' tbl
#'
#' This is the primary function of fastrep, with her you can make tables in HTML or LaTeX format,
#' the main idea is to provide minimal parameters to create their own table,
#' so you necessarily only need to provide a data.frame
#'
#'
#' @param obj     Object used to create the table.
#'
#' `data.frame`, `list` or environment
#' (or object coercible by `as.data.frame` to a `data.frame`)
#' @param title     Title for the table, write in string format
#' @param format  Format of table, write in string format. Possible values are `"latex"`, "`html`".
#' @param code  If you want the table code to appear in the console, put `code = TRUE`, you can combine with `format`.
#' @param tabs  If you want a row separator inside table, put `tabs = FALSE`.
#' @param full_page  If you want the table not to take up the full width of the page, put `full_page = FALSE`.
#' @param ...     Other arguments
#' @note Remember that by default the format is `"html"`
#'
#' The default of `code` is `FALSE`
#' The default of `tabs` is `TRUE`
#' The default of `full_page` is `TRUE`
#'
#' The value of  `format`  will be automatically determined if the function is called within a knitr document
#' @examples
#' iris %>%
#'   dplyr::group_by(Species) %>%
#'   dplyr::summarise(mean = mean(Sepal.Length)) %>%
#'   fastrep::tbl("THIS FUNCTION IS SO INCREDIBLE!")
#'
#' mtcars |>
#'   dplyr::group_by(carb) |>
#'   dplyr::summarise(sd = sd(wt)) |>
#'   fastrep::tbl()
#'
#' @return Your object of input in the format of a knitr_kable
#' @export
tbl <- function(obj, title = "", format = NULL, code = FALSE, tabs = FALSE,
                     full_page = TRUE, ...) {
  if (code == TRUE) {
    obj %>%
      kableExtra::kable(caption = title, align = "c", format = format,
                        booktabs = !tabs)
  } else {
    obj %>%
      kableExtra::kable(caption = title, align = "c", format = format,
                        booktabs = !tabs) |>
      kableExtra::kable_classic(latex_options = "HOLD_position",
                                full_width = full_page, ...)
  }
}
