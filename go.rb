# https://github.com/smj10j/git-notified-on-trello

# Get consumer key by calling
# https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never

## SET THESE ENVIRONMENT VARIABLES
DEVELOPER_KEY = ENV['DEVELOPER_KEY']
MEMBER_TOKEN = ENV['MEMBER_TOKEN']

require 'trello'

if ( ARGV.size < 3) 
    puts "Usage: go.rb author branch commit_msg"
    exit
end

AUTHOR=ARGV[0]      #"Stephen Johnson"
BRANCH=ARGV[1]      #"mocking-git-plugin-idea"
COMMIT_MSG=ARGV[2]  #"I got a basic example up and running. Is it useful?\n\nhttps://trello.com/c/hR3cSUiu/1189-git-trello-plugin"

matches = COMMIT_MSG.match(/^.*?trello\.com\/\w\/([\w]+?)\b.*?$/)
if ( matches && matches.size > 0 ) 

    client = Trello::Client.new(
      :developer_public_key => DEVELOPER_KEY,
      :member_token => MEMBER_TOKEN
    )

    cardId = matches[1]
    card = client.find(:card, cardId)
    print "#{card.name} was found for card id #{cardId}]\n"
    
    comment = "\n"
    comment+= "** This is an automated post made through Steve's account **"
    comment+= "\n\n"
    comment+= "#{AUTHOR} just committed a change to *#{BRANCH}* and tagged this card with the following message:\n"
    comment+= "     \n"
    comment+= "     \"#{COMMIT_MSG}\""
    
    card.add_comment(comment)

end
