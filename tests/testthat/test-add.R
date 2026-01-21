test_that("add works with basic numbers", {
  expect_equal(add(2, 3), 5)
  expect_equal(add(-1, 1), 0)
  expect_equal(add(0, 0), 0)
})

test_that("add handles decimals", {
  expect_equal(add(1.5, 2.5), 4)
})

test_that("add validates input", {
  expect_error(add("a", 3), "must be numeric")
  expect_error(add(2, "b"), "must be numeric")
})

# Tests for sum_array
test_that("sum_array works correctly", {
  expect_equal(sum_array(1:10), 55)
  expect_equal(sum_array(c(1, 2, 3, 4, 5)), 15)
  expect_equal(sum_array(numeric(0)), 0)
  expect_equal(sum_array(c(1, 2, 3)), 6)  # remainder case
})

test_that("sum_array matches base R sum", {
  set.seed(42)
  x <- rnorm(1000)
  expect_equal(sum_array(x), sum(x), tolerance = 1e-10)
})

test_that("sum_array validates input", {
  expect_error(sum_array("not numeric"), "must be numeric")
})