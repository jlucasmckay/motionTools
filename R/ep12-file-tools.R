#ep12-file-tools.R

#' Replace common directory locations like Z:\ with the MotionAnalysis root directory
#' @export
UnixizeMotionPath = function(x){
  x = gsub("Z:\\groups\\", "", x, fixed = T)
  x = gsub(":\\groups\\", "", x, fixed = T)
  x = gsub("\\", "/", x, fixed = T)
  x = gsub("/groups/MotionAnalysis", "MotionAnalysis", x)
  return(x)
}
