#' Push a message
#'
#' Push a message to a phone or a computer after is done. It can send random messages when code is complete or there is an error.
#'
#' @param message String message to be sent to the pushover app. If none is provided, the function will randomly choose a message from its own list.
#' @param error For outputting error messages. If `TRUE`, it will randomly select an error message. If `FALSE` (default), it will randomly select a completion message.
#' @param add_message Additional string message that can be added to the main text.
#'
#' @return Random message on your phone/computer.
#'
#' @examples
#' pushme()
#' pushme(error = TRUE)
#' pushme("This is my own message")
#'
#' i = 20
#' pushme(error = TRUE, add_message = paste("Failure on iteration", i))
#'
#' @export
pushme <- function(message = NULL, error = FALSE, add_message = NULL){

  checkmate::assert_flag(error)

  msg_list = c(paste(emoji::emoji("dancer"),"Woohoo! Dreams are not dead! Code is done!",emoji::emoji("celebrate")),
               paste(emoji::emoji("flower"),"You smell like flowers",emoji::emoji("flower"),"Now get to work, because your code is done!",emoji::emoji("sparkles")),
               paste(emoji::emoji("alarm"),"C'mon, get moving! Code is DONE!", emoji::emoji("boom")),
               paste(emoji::emoji("alarm"), "Go, go, go! You're code is ready to roll", emoji::emoji("celebrate")),
               paste(emoji::emoji("grinning face with big eyes"), "What do you know? Code.Is.Done.",emoji::emoji("grinning face with big eyes")),
               paste(emoji::emoji("smiling face with heart-eyes"), "You beautiful creature! Your code just finished.",emoji::emoji("smiling face with hearts")),
               paste(emoji::emoji("party popper"), "Code's done! Now go forth and conquer!", emoji::emoji("trophy")),
               paste(emoji::emoji("rocket"), "Blast off! Your code just landed successfully!", emoji::emoji("star")),
               paste(emoji::emoji("nerd face"), "The code is done, and you're officially a genius!", emoji::emoji("brain")),
               paste(emoji::emoji("coffee"), "Code's done! Time for coffee... or something stronger?", emoji::emoji("beverage")),
               paste(emoji::emoji("checkered flag"), "Code complete! You're racing towards greatness!", emoji::emoji("sports medal")),
               paste(emoji::emoji("unicorn"), "Believe it or not, the code is finished! Magic!", emoji::emoji("sparkles")),
               paste(emoji::emoji("clap"), "Code done! Give yourself a round of applause!", emoji::emoji("clap")),
               paste(emoji::emoji("sun with face"), "The code shines bright like the sun. You're unstoppable!", emoji::emoji("sparkles")),
               paste(emoji::emoji("rainbow"), "Rainbows and butterflies! Your code is complete!", emoji::emoji("butterfly")),
               paste(emoji::emoji("robot"), "Beep boop! Your code is done. Time to recharge!", emoji::emoji("battery")))

  if(isTRUE(error)){
    msg_list = c(paste(emoji::emoji("poop"),"Oh no! Something doesn't smell right. Check your code.",emoji::emoji("sad")),
                 paste(emoji::emoji("boom"),"Something's broken! Go check your work!",emoji::emoji("flower")),
                 paste(emoji::emoji("thermometer"),"Your code is SICK... but not in a good way. Go check it out, because you got an error.", emoji::emoji("face with head-bandage")),
                 paste(emoji::emoji("police car light"), "Oops! Mistakes happen... and it just did. Check your R!", emoji::emoji("police car light")),
                 paste(emoji::emoji("warning"), "Danger! Your code just tripped a wire. Check it out!", emoji::emoji("boom")),
                 paste(emoji::emoji("bug"), "Uh-oh! There's a bug in the code. Go squash it!", emoji::emoji("hammer")),
                 paste(emoji::emoji("face with head-bandage"), "Ouch! Your code took a hit. Time for some debugging!", emoji::emoji("ambulance")),
                 paste(emoji::emoji("thinking face"), "Hmm... something's not right. Better rethink that code!", emoji::emoji("thought balloon")),
                 paste(emoji::emoji("zany face"), "Your code's seeing stars! Go fix it!", emoji::emoji("collision")),
                 paste(emoji::emoji("bomb"), "Kaboom! The code exploded. Time to defuse it!", emoji::emoji("sweat droplets")),
                 paste(emoji::emoji("face with monocle"), "Something suspicious is going on... better investigate that code!", emoji::emoji("magnifying glass tilted left")),
                 paste(emoji::emoji("fire"), "Your code is on fire... but not in a good way! Go check it!", emoji::emoji("fire extinguisher")),
                 paste(emoji::emoji("cross mark"), "Nope! That didn't work. Back to the drawing board!", emoji::emoji("pencil")),
                 paste(emoji::emoji("ghost"), "Boo! A spooky error just appeared. Time to haunt your code!", emoji::emoji("flashlight")))
  }

  msg = sample(msg_list,1)

  if(!is.null(message)){
    msg = message
  }

  if(!is.null(add_message)){
    msg = paste(msg,"-",add_message)
  }

  pushoverr::pushover(message = msg, priority = 1, sound = "tugboat")

}

