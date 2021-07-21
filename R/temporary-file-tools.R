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
#' @export
HardCopyRightThere = function(d,f = "hardcopy.csv",addtime = T){
  readr::write_csv(d,DateFile(f,addtime),na="")
  d
}

#' Read the most recent csv with a name spec from HardCopyRightThere
#' @export
ReadHardCopy = function(f = "hardcopy.csv"){
  d = dirname(f)
  b = tools::file_path_sans_ext(f)
  e = tools::file_ext(f)

  files = tools::list_files_with_exts(dir = d, exts = e)
  # note that this may fail if user supplies file names like mpg and mpg34; this behavior is not supported.
  matchingFiles = files[startsWith(files,file.path(d,b))]
  mostRecentFile = head(sort(matchingFiles,T),1)
  readr::read_csv(mostRecentFile)
}
