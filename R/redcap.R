# redcap.R

#' Read data from a REDCap report.
#' Arguments are as supplied in API playground.
#'
#' The API token should be stored in the user's .Renviron file.
#'
#' @importFrom magrittr %>%
#' @export
ReadRedcapReport = function(
  token,
  url = "https://redcap.emory.edu/api/",
  report_id = '29228',
  format='csv',
  csvDelimiter='',
  rawOrLabel='raw',
  rawOrLabelHeaders='raw',
  exportCheckboxLabel='false',
  returnFormat='json')
  {
  form.data <- list(token=token,
                    content='report',
                    format=format,
                    report_id=as.character(report_id),
                    csvDelimiter=csvDelimiter,
                    rawOrLabel=rawOrLabel,
                    rawOrLabelHeaders=rawOrLabelHeaders,
                    exportCheckboxLabel=exportCheckboxLabel,
                    returnFormat=returnFormat
  )
  response <- httr::POST(url, body = form.data, encode = "form")
  httr::content(response)
}
