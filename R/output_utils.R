data_header <- function(store, department) {
  paste0("Showing data from store ", store, " and department ", department)
}

subset_data <- function(data, cols) {
  valid_cols <- intersect(cols, colnames(data))
  if (!length(valid_cols)) {
    return(data)
  }
  data[, valid_cols, drop = FALSE]
}

sample_data <- function() {
  data.frame(
    'Dept' = 1:3,
    "Date" = rep(Sys.Date(), 3),
    "Temperature" = rep(20, 3),
    "Fuel_Price" = rep(1.2, 3),
    "CPI" = rep(0.7, 3),
    "Unemployment" = rep(0.4, 3),
    "IsHoliday" = rep(FALSE, 3),
    "Weekly_Sales" = c(12002, 11023, 9872),
    "Name" = c("Candy and Tobacco", "Health and Beauty Aids", "Stationery")
  )
}
