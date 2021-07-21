#table-tools.R

#' Print a dataframe nicely
#' @export
PrintNicely = function(d) kableExtra::kable_styling(kableExtra::kable(d),full_width=F,position="left")

#' Fix a column
#' @export
FixColumn = function(demo_tab){
  names(demo_tab)[1] = "Variable"
  # remove the nonbreaking space characters from the first columns
  demo_tab$Variable = demo_tab$Variable %>% gsub("&nbsp;","",.)
  demo_tab
}

#' Get rid of "N-Miss" rows in tableby output
#' @export
FilterNMiss = function(dframe) dframe[dframe[,1] %omits% "N-Miss",]

#' Get rid of "Range" rows in tableby output
#' @export
FilterRange = function(dframe) dframe[dframe[,1] %omits% "Range",]

