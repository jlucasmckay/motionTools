# Functions that emulate behavior of a subset of the pathlib Python module.

# regex to extract base path and extension from a file path
reg_ext  = '([.](([[:alnum:]]+|tar[.](gz|bz2|xz)|nb[.]html)[~#]?))$'
reg_path = paste0('^(.*?)', reg_ext)

#' A character vector of the parts of the path
#' @export
parts = function(f = "hardcopy.csv"){
  joinPath(dirname(f),f) |> strsplit(.Platform$file.sep,fixed=T)
}

#' The logical parent of the path
#' @export
parent = function(f = "hardcopy.csv"){
  dirname(f)
}

#' The file extension of the final component, if any
#' @export
suffix = function(f = "hardcopy.csv"){
  ext = character(length(f))
  i = grep(reg_path, f)
  ext[i] = sub(reg_path, '\\3', f[i])
  # add leading dot if extension is not empty
  ifelse(ext == "",ext,paste0(".",ext))
}

#' A string representing the final path component, excluding the drive and root, if any
#' @export
name = function(f = "hardcopy.csv"){
  basename(f)
}

#' The final path component, without its suffix
#' @export
stem = function(f = "hardcopy.csv"){
  sub(paste0(suffix(f),"$"),"",name(f))
}

#' A path join function (adapted from Gmisc)
#'
#' This function joins strings into a valid path. It is a simple version of python's
#' \code{os.path.join} and fixes simple problems such as having/not having trailing /
#' in each section.
#'
#' @param ... A set of strings to join
#' @return \code{string} A string with the merged path
#'
#' @examples
#' pathJoin("my_base_path/helpers", "superfunction.R")
#' # 'my_base_path/helpers/superfunction.R'
#' @importFrom stringr str_replace
#' @export
joinPath = function(...) {
  paths = list(...) |> unlist()
  clean_paths = lapply(paths, function(x) str_replace(x, "[\\/]$", ""))
  sub("//",.Platform$file.sep,do.call(file.path, clean_paths))
}
