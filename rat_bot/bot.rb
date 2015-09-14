require 'cinch'
require 'net/https'
require 'json'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.mibbit.net"
    c.channels = ["#Five0h0ne_test"]
    c.nick = 'RatBot'
  end

  on :message, "hello" do |m|
    m.reply "Hello, #{m.user.nick}"
  end

  on :join do |m|
    uri = URI.parse("https://fierce-plains-5493.herokuapp.com/requests/search?search=#{m.user.nick}")
    response = Net::HTTP.get_response(uri)
    debug("RESPONSE: #{response.code}")
    return unless response.code == '200'

    data = JSON.parse response.body
    string = "Shit the bed boys! #{data['cmdr_name']} (#{data['platform']}) needs fuel! System: #{data['system']}"
    m.channel.send(string)
    m.channel.send("Further data: https://fierce-plains-5493.herokuapp.com/requests/#{data['id']}")
  end
end

bot.start
