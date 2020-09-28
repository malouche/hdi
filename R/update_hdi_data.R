#' Extract Human Development Index Data
#'
#' This function extract the  small dataset each year which consists of approximately 144 indicators by country and year.
#' The dowloaded data contains 6 variables : indicator_id, indicator_name, country_code, country_name, year, value


update_hdi_data <- function() {
  url<-'http://ec2-54-174-131-205.compute-1.amazonaws.com/API/hdro_api_all.json'
  response <- httr::GET(url)
  xn=names(cont[[1]])
  dfs <- lapply(cont, function(x) {
    structure(data.frame(x, stringsAsFactors = FALSE),
              names = xn)
  })

  df <- do.call(rbind, dfs)
  return(df)
}
