#' Set user and app token
#'
#' Wrapper function for `set_pushover_user()` and `set_pushover_app()` to set pushover user and app token. Get a user and token at [https://pushover.net/].
#'
#' @param user User id (string) from pushover app.
#' @param token App token (string) from pushover app.
#'
#' @return Random message on your phone/computer.
#'
#' @examples
#' set_pushme(user = "uQiRzpo4DXghDmr9QzzfQu27cmVRsG", token = "azGDORePK8gMaC0QOYAMyEEuzJnyUi")
#'
#' @export
set_pushme <- function(user = "", token = ""){
  
  checkmate::assert_string(user)
  checkmate::assert_string(token)
  
  pushoverr::set_pushover_user(user = user)
  pushoverr::set_pushover_app(token = token) 
}