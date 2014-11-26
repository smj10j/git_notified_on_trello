git-notified-on-trello
======================

Get notified of pushes to a Git Repo with updates to relevant Trello cards


Setup
-----

https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never
-
http:// www


### TODO ###

- provide example usage
- clean up and comment a bit
- package into a gem
- make idempotent 
- make a plugin for jenkins 
- send two separate messages 
  - on commit, as it does now
  - on deploy
- style the comments with some fancy markdown



# Get consumer key by calling
# https://trello.com/1/authorize?key=16f7525a7039ee80c23365e648b8a542&name=Git%20Notified%20on%20Trello&response_type=token&scope=read,write,account&expiration=never

# If you'd like to use your own application, replace the above with this:
# https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never
