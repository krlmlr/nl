context("nl")

test_that("regular case", {
  expect_equal(nl({1;2;3}), as.list(1:3))
})

test_that("side effects", {
  expect_error(a)
  expect_equal(nl({ a <- 1; b <- a}), list(1, 1))
  expect_equal(a, 1)
})

test_that("corner cases", {
  expect_equal(nl({1}), list(1))
  expect_equal(nl({}), list())
})

test_that("error handling", {
  expect_error(nl(1), "brace")
  expect_error(nl(), "missing")
})

test_that("name clash", {
  expected <- list(1)
  list <- function(...) stop("Gotcha!")
  expect_equal(nl({1}), expected)

  `::` <- function(...) stop("Gotcha again!")
  expect_equal(nl({1}), expected)
})
