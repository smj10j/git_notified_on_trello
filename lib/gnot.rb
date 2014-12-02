#
# Git Notified on Trello
#
# https://github.com/smj10j/git-notified-on-trello
#
require './lib/gnot/version'
module GNOT

  class GitNotifiedOnTrello

    def initialize
      if (!ENV['DEVELOPER_KEY'])
        puts "An environment variable named DEVELOPER_KEY must be set to your Trello developer key"
        puts "Generate your credentials here: https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never"
        exit
      end

      if (!ENV['MEMBER_TOKEN'])
        puts "An environment variable named MEMBER_TOKEN must be set to your Trello member token"
        puts "Generate your credentials here: https://trello.com/1/authorize?key=YOUR_API_KEY&name=YOUR_APP_NAME&response_type=token&scope=read,write,account&expiration=never"
        exit
      end
    end

    require 'trollop'


    opts = Trollop::options do
      opt :author,    "The commit author",           :type => :string,      :required => true
      opt :branch,    "The branch the commit is on", :type => :string,      :required => true
      opt :commit,    "The commit hash",             :type => :string,      :required => true
      opt :message,   "The commit message",          :type => :string,      :required => true
      opt :version,   GNOT::VERSION
      opt :help
    end

    matches = opts.message.match(/^.*?trello\.com\/\w\/([\w]+?)\b.*?$/)
    if ( matches && matches.size > 0 )

      require 'trello'

      begin
        client = Trello::Client.new(
            :developer_public_key => ENV['DEVELOPER_KEY'],
            :member_token => ENV['MEMBER_TOKEN']
        )
      rescue
        @error_message="#{$!}"
        puts "#{@error_message}"
        exit 1
      ensure

      end


      cardId = matches[1]
      card = client.find(:card, cardId)
      cardMessage = (' '+opts.message+' ').gsub(/https?[:\/\W]*?.trello.com[^ ]*/, "")
      cardMessage = "> " + cardMessage.gsub(/[\r\n]|([\\]n)/, "
> ")
      print "#{card.name} was found for card id #{cardId}\n"

      comment = "\n"
      comment+= "** ...whrr.. This is an automated post by the Trello Robot.. bzz.. **\n"
      comment+= "\n"
      comment+= "Branch *#{opts.branch}*\n"
      comment+= "#{opts.author} committed #[#{opts.commit}](https://github.com/Extrabux/Extrabux-Complete/commits/#{opts.commit})\n"
      comment+= "\n"
      comment+= "following message:\n"
      comment+= "\n"
      comment+= "#{cardMessage}"

      card.add_comment(comment)

    end
  end
end
