#' Multi-Bar Horizontal Plot in R
#'
#' Visualizes horizontal bars, grouped and stacked.
#'
#' @param df json data, which looks like the one in examples/reg_results.txt (see GitHub). Please create a file and read from it.
#'
#' @import htmlwidgets
#'
#' @references
#' Kolpashnikova, Kamila. (2022). Multi-Bar Horizontal Plot in R. Toronto,ON: York University.
#'
#'
#' @export
MultibarHorizontal <- function(df, xax = "X Axis", yax = "Y Axis", width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data = df,
    xaxis = xax,
    yaxis = yax,
    message = "works"
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'MultibarHorizontal',
    x,
    width = width,
    height = height,
    package = 'MultibarHorizontal',
    elementId = elementId
  )
}

#' Shiny bindings for MultibarHorizontal
#'
#' Output and render functions for using MultibarHorizontal within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a MultibarHorizontal
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name MultibarHorizontal-shiny
#'
#' @export
MultibarHorizontalOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'MultibarHorizontal', width, height, package = 'MultibarHorizontal')
}

#' @rdname MultibarHorizontal-shiny
#' @export
renderMultibarHorizontal <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, MultibarHorizontalOutput, env, quoted = TRUE)
}
