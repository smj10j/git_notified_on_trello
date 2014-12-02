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



DEVELOPER_KEY="16f7525a7039ee80c23365e648b8a542" \
MEMBER_TOKEN="4c298813ca0798c974c45e1a7657adecfc47b77a93e7d56c8d1b8a1cd9198168" \
./bin/gnot -a "Stephen Johnson" -b "feature-git-notified-on-trello" -c "3463457" -m " Is it useful?\n\nhttps://trello.com/c/hR3cSUiu/1189-git-trello-plugin \nLine break on the shell like a normal commit messages would be.\n\nLet's try some *markdown*\n-------------------------\n"




# Get consumer key by calling
# https://trello.com/1/authorize?key=16f7525a7039ee80c23365e648b8a542&name=Git%20Notified%20on%20Trello&response_type=token&scope=read,write,account&expiration=never

# If you'd like to use your own application, replace the above with this:
# https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never
