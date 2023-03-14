test_that("data_header returns valid message", {
  expect_equal(
    data_header(1, 10),
    "Showing data from store 1 and department 10"
  )
})

test_that("subset_data returns data.frame with selected columns", {
  test_data <- data.frame(
    a = 1:10,
    b = letters[1:10],
    c = LETTERS[1:10]
  )
  expect_equal(
    subset_data(test_data, c("a", "b")),
    data.frame(a = 1:10, b = letters[1:10])
  )
  expect_equal(
    subset_data(test_data, c("b")),
    data.frame(b = letters[1:10])
  )
  expect_equal(
    subset_data(test_data, NULL),
    test_data
  )
  expect_equal(
    subset_data(test_data, c("d")),
    test_data
  )
})
