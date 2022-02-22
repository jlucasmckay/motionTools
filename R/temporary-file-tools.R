# temporary-file-tools.R

#' Add a date (time) stamp to a generic file.ext
#' @export
DateFile = function(f, addtime = F, sep = "_"){
  n = tools::file_path_sans_ext(f)
  e = tools::file_ext(f)
  d = stringr::str_replace_all(Sys.Date(),"-",sep)
  t = stringr::str_replace_all(format(Sys.time(), "%X"),":",sep)
  fname = ifelse(addtime,paste0(n,sep,d,sep,t,".",e),paste0(n,sep,d,".",e))
}

#' Write a csv file somewhere within or at the end of a pipe.
#' 
#' @param f a string e.g. "file.csv"
#' @param addtime a logical indicating whether to add a timestamp 
#' 
#' @export
HardCopyRightThere = function(d,f = "hardcopy.csv",addtime = T){
  readr::write_csv(d,DateFile(f,addtime),na="")
  d
}



#' Read a file from HardCopyRightThere
#'
#' The user supplies a candidate filename as a string, the function sorts all files in the directory matching that filename and loads the first in sorted order.
#' Note that if HardCopyRightThere has supplied a timestamped file, this will read the first match without a timestamp, or, barring that, the most recent timestamp.
#'
#' @export
ReadHardCopy = function(f = "hardcopy.csv"){
  d = dirname(f)
  s = stem(f)
  e = suffix(f)
  
  matching.files = sort(list.files(d,(paste0("^",s))),decreasing = TRUE)
  readr::read_csv(matching.files[1])
}

