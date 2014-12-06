#
# Git Notified on Trello
#
# https://github.com/smj10j/git-notified-on-trello
#

require 'trello'

module GitNotifiedOnTrello

  class Notifier

    def initialize(attrs = {})
      @client = Trello::Client.new(
          :developer_public_key => attrs[:developer_public_key],
          :member_token => attrs[:member_token]
      )
      @debug = attrs[:debug] == nil ? false : attrs[:debug]
    end

    def notify(branch, commit, author, message)

      matches = message.match(/^.*?trello\.com\/\w\/([\w]+?)\b.*?$/)
      if ( matches && matches.size > 0 )

        cardId = matches[1]
        card = @client.find(:card, cardId)
        cardMessage = (' '+message+' ').gsub(/https?[:\/\W]*?.trello.com[^ ]*/, "")
        cardMessage = "> " + cardMessage.gsub(/[\r\n]|([\\]n)/, "
> ")
        print "Trello card \"#{card.name}\" was found with card id #{cardId}\n"

        comment = "\n"
        comment+= "** ...whrr.. This is an automated post by the Trello Robot.. bzz.. **\n"
        comment+= "\n"
        comment+= "Branch *#{branch}*\n"
        comment+= "\n"
        comment+= "#{author} committed #[#{commit}](https://github.com/Extrabux/Extrabux-Complete/commits/#{commit})\n"
        comment+= "\n"
        comment+= "#{cardMessage}"

        if(@debug)
          print comment
        end
        card.add_comment(comment)

      else
        if(@debug)
          print "No Trello card was found in message \"#{message}\"\n"
        end
      end
    end
  end
end
