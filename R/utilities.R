# utilities.R

usethis::use_pipe(export = TRUE)

#' horizontal rule for terminal output
#' @export
hrule = function() paste0(rep("-", getOption("width") - 2L), collapse = "")

#'Alias for cat(x,sep=newline)
#' @export
catsep = function(x,sep="\n") cat(x,sep=sep)

#' Alias for cat(names(x),sep=newline)
#' @export
catnames = function(x,sep="\n") cat(names(x),sep=sep)

#' Alias for setwd()
#' @export
cd = function(d) setwd(d)

#' Alias for getwd()
#' @export
pwd = function() getwd()

#' Infix check for pattern at start of first argument
#' @export
#' @rdname startswith
`%startswith%` = function(s, pattern) startsWith(s, pattern)

#' Infix check for pattern at end of first argument
#' @export
#' @rdname endswith
`%endswith%` = function(s, pattern) endsWith(s, pattern)


#' Infix check for pattern present in first argument
#' @export
#' @rdname contains
`%contains%` = function(s, pattern) grepl(pattern, s)

#' Infix check for pattern absent in first argument
#' @export
#' @rdname omits
`%omits%` = function(s, pattern) !grepl(pattern, s)

#' Opposite of "in"
#' @export
#' @rdname notin
`%notin%` = Negate(`%in%`)

#' infix dot product
#' @export
#' @rdname dot
`%dot%` = function(x,y) sum(x*y)

#' Mean, ignore NaN
#' @export
nanmean = function(x) mean(x, na.rm = T)

#' Mean, ignore NaN
#' @export
NanMean = function(x) mean(x, na.rm = T)

#' Standard Deviation, ignore NaN
#' @export
nanstd = function(x) sd(x, na.rm = T)

#' Standard Deviation, ignore NaN
#' @export
NanStd = function(x) sd(x, na.rm = T)

#' Variance, ignore NaN
#' @export
nanvar = function(x) var(x, na.rm = T)

#' Variance, ignore NaN
#' @export
NanVar = function(x) var(x, na.rm = T)

#' @export
MnSd = function(x,n.digits = 1)
  if (length(x)>1) {
    paste(round(mean(x,na.rm=T),1), round(sd(x,na.rm=T),1), sep="±")
  } else {
    paste(round(mean(x,na.rm=T),1))
  }

#' Open in system viewer
#' @export
ViewExcel = function(x){
  fname = paste0(tempfile(".temp.csv","."),".csv")
  write_csv(x,fname,na="")
  system2("open",fname)
}

#' XY array to tibble for visualization
#' @export
XyToTibble = function(xy){
  r = dim(xy)[1]
  c = dim(xy)[2]
  x = 1:r
  dim(x) = c(r,1)

  tibble(
    x = as.integer(drop(pracma::Reshape(pracma::repmat(x,1,c),r*c))),
    y = as.integer(drop(pracma::Reshape(pracma::repmat(1:c,r,1),r*c))),
    value = drop(pracma::Reshape(xy,r*c)))
}

#' Tibble to XY array for visualization
#' @export
TibbleToXy = function(tib){
  out = matrix(nrow = nrow(tib), ncol = nrow(tib))
  for(i in nrow(tib)){
    out[tib$x[i],tib$y[i]] = tib$value[i]
  }
  out
}

#' Add a singleton dimension
#' @export
AddDim = function(im0){
  im1 = im0
  dim(im1) = c(dim(im1),1)
  im1
}

#' Fix names in a pipe
#' @importFrom magrittr %>%
#' @export
FixNames = function(t){
  names(t) = names(t) %>% tolower() %>% str_replace_all(" ",".") %>% str_remove_all("[^a-zA-Z0-9\\.]")
  t
}









