

<p align="center">

<img src="https://github.com/maibennett/pushme/blob/main/images/header.PNG?raw=TRUE" width="70%">
</p>

# Pushme

Do you ever have to step away from your code and want to know when it’s
done or throws an error?

**Wonder no more!**

This is a wrapper for the
[`pushoverr`](https://github.com/briandconnelly/pushoverr) R package
(developed by Brian Connelly) that will send random messages through the
[pushover](https://pushover.net/) app with relevant information – or
just cheerful notes – on the status of your code.

# Installation

To use `pushme` you will need to get a user key and app token for the
device you want to send messages to.

1)  Download the `pushover` app from [pushover](https://pushover.net/),
    either on your phone or desktop.
    - As of Dec. 8th 2024, there is a one-time purchase payment of
      \$4.99 USD for each platform (iPhone/iPad, Android, and Desktop).
      You also get a free 30 day trial.

    - When you create an account, the platform will provide a **user
      key**.
2)  Create an application for your messages (e.g. `RCode`). You will
    have access to 10,000 messages/month
    - When creating a new application, the platform will provide an
      **app token**
3)  Install the `pushme` package in R.
    - You will need to install `pushoverr` as well as the `emoji`
      package. I also recommend installing `usethis` to save your app
      token and user key as R environment variables.

``` r
install.packages("pushoverr")
install.packages("emoji")
install.packages("usethis")

# install.packages("devtools")
devtools::install_github("maibennett/pushme")
```

4a) *If you have installed* `usethis`, you can set your app token and
user key in your R environment

``` r
usethis::edit_r_environ()
```

and save them as `PUSHOVER_USER` and `PUSHOVER_APP` as following

    PUSHOVER_USER=uQiRzpo4DXghDmr9QzzfQu27cmVRsG
    PUSHOVER_APP=azGDORePK8gMaC0QOYAMyEEuzJnyUi

4b) *If you have not installed* `usethis`, you can set your app token
and user key for the specific R session as following:

``` r
set_pushme(user = "uQiRzpo4DXghDmr9QzzfQu27cmVRsG", token = "azGDORePK8gMaC0QOYAMyEEuzJnyUi")
```

5)  Get ready to use this! If you just want to know when a code ends…

``` r
library(pushme)

sim = 10
x_mean = rep(NA, 100)

for(i in 1:sim){
  
  set.seed(i)
  
  x = sample(c(0,1), 20, replace = TRUE)
  
  x_mean[i] = mean(x)
  
}

pushme()
```

<p align="center">

<img src="https://github.com/maibennett/pushme/blob/main/images/code_done.PNG?raw=TRUE" width="40%">
</p>

… or when there’s an error…

``` r
library(pushme)

sim = 5

for (i in 1:sim) {
  
  tryCatch({
    set.seed(i)
    
    denom = sample(c(0, 1), 1)
    
    # Force an error if denom is 0
    if (denom == 0) {
      stop("Denominator is zero!")
    }
    
    result <- 1 / denom
    print(paste("Iteration", i, "result:", result))
    
  }, error = function(e) {
    pushme(error = TRUE, add_message = paste("Error on iteration", i))
    message(paste("Error on iteration", i, ":", e$message))
  })
  
}
```

<p align="center">

<img src="https://github.com/maibennett/pushme/blob/main/images/error_message.PNG?raw=TRUE" width="40%">
</p>

… or if you want your own message…

``` r
sim = 100
x_mean = rep(NA, 100)

for(i in 1:sim){
  
  set.seed(i)
  
  x = sample(c(0,1), 20, replace = TRUE)
  
  x_mean[i] = mean(x)
  
  if(i == 50){
    pushme(message = "Oooh, we're half way there!")
  }
  
  if(i == 100){
    pushme(message = "This is D-O-N-E")
  }
}
```

<p align="center">

<img src="https://github.com/maibennett/pushme/blob/main/images/personal_message.PNG?raw=TRUE" width="40%">
</p>

# References

- Connelly B (2021). *pushoverr: Send Push Notifications using
  ‘Pushover’*. R package version 1.1.0,
  <https://CRAN.R-project.org/package=pushoverr>.

- Hvitfeldt E (2024). *emoji: Data and Function to Work with Emojis*. R
  package version 16.0.0, <https://CRAN.R-project.org/package=emoji>.

- Wickham H, Bryan J, Barrett M, Teucher A (2024). *usethis: Automate
  Package and Project Setup*. R package version 3.1.0,
  <https://CRAN.R-project.org/package=usethis>.
