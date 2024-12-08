test_that("Test argument formats", {
  
  error = 1
  expect_error(pushme(error = error))
  
  message = TRUE
  expect_error(pushme(message = message))
  
  add_message = FALSE
  expect_error(pushme(add_message = add_message))
})