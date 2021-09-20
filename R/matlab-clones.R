#matlab-clones

#' create a vector or matrix of NA
#' @export
na = function(nr,nc = 1){
  if(nc>1){
    out = array(dim = c(nr,nc))
  }else{
    out = numeric(nr)
    out[out==0] = NA
  }
  out
}

#' create a vector or matrix of ones
#' @export
ones = function(nr,nc = 1){
  out = na(nr,nc)
  out[is.na(out)] = 1
  out
}

#' create a vector or matrix of zeros
#' @export
zeros = function(nr,nc = 1){
  out = na(nr,nc)
  out[is.na(out)] = 0
  out
}

#' create a vector or matrix of zeroes
#' @export
zeroes = function(nr,nc = 1) zeros(nr,nc)
