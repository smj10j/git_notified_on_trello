git_notified_on_trello
======================

Get notified of pushes to a Git Repo with updates to relevant Trello cards


### Setup ###

To enable posting to Trello, you must get authorization to post on behalf of a user.

Trello makes this very easy. 

You can read more on the [Trello API Documentation](https://trello.com/docs/) pages, but here's the quick-start:


1. Generate (or view it if you've already created one) your developer key [https://trello.com/1/appKey/generate](https://trello.com/1/appKey/generate) 

2. Generate a consumer key / member token 
    - Replace YOUR_API_KEY with the key received above
    - Replace YOUR_APP_NAME with the friendly name you'd like to display to users
    - Modify *scope* and *expiration* for your needs
    
    Template: https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never
    
    More information can be found on Trello [Getting a Token From a User](https://trello.com/docs/gettingstarted/index.html#getting-a-token-from-a-user)


Here's a wizard that'll walk you through generating the URL:

```bash
curl -sSfL https://raw.githubusercontent.com/smj10j/git_notified_on_trello/master/docs/trello-get-oauth-url-wizard.sh | /bin/bash
```

 


### Installation ###

```bash
gem install git_notified_on_trello
```



### Usage ###


#### As a gem within your project ####

```ruby
require 'git_notified_on_trello'

notifier = GitNotifiedOnTrello::Notifier.new(
    :developer_public_key => <YOUR TRELLO DEV KEY>,
    :member_token => <A TRELLO MEMBER TOKEN>,
    :debug => true
)
notifier.notify(
    "feature-git-notified-on-trello",                                             // Branch
    "b7cb566c2310697f401c51433dce6b6399429fdb",                                   // Commit hash
    "Stephen Johnson",                                                            // Commit author
    "Updated the readme per https://trello.com/c/hR3cSUiu/1189-git-trello-plugin" // Commit message
)
```



#### On the command-line ####

```bash
DEVELOPER_KEY="<YOUR TRELLO DEV KEY>" \
MEMBER_TOKEN="<A TRELLO MEMBER TOKEN>" \
gnot \
-b "feature-git-notified-on-trello" \
-c "b7cb566c2310697f401c51433dce6b6399429fdb" \
-a "Stephen Johnson" \
-m "Updated the readme per https://trello.com/c/hR3cSUiu/1189-git-trello-plugin"
```




### TODO ###

- Clean up and comment a bit
- Make idempotent and add function to watch a git repo for commits  
- Make a plugin for Jenkins 
- Send two separate messages 
  - On commit, as it does now
  - On deploy
- Add tests...

