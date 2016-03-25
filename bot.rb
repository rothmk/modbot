require 'cinch'
#require './lib/timer'
require './lib/regexes'

regexes = Regexes.new

bot = Cinch::Bot.new do
	configure do |c|
		c.server = "irc.twitch.tv"
		c.channels = [ENV["DOXBOT_CHANNEL"]]
		c.password = ENV["DOXBOT_BOT_PW"]
		c.nick = ENV["DOXBOT_BOT_NICK"]
		#c.plugins.plugins = [TimerPlugin]
	end

	on :message, "hello" do |m|
	    m.reply "Hello, #{m.user.nick}"
	    m.reply "/ban #{m.user.nick}"
	end

	on :message do |m|
		if !regexes.list.map {|regex| m.params[1] =~ regex}.index {|item| !item.nil?}.nil?
			m.reply "/timeout #{m.user.nick} 1"
		end
	end

	on :message, '!refreshlist' do
		regexes.refresh_list
	end
end

bot.start