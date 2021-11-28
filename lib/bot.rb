require 'discordrb'

require_relative 'GameBoi/Commands/game_commands.rb'
require_relative 'GameBoi/Commands/dice_commands.rb'


module GameBoi
  load('config.rb')
  @bot = Discordrb::Commands::CommandBot.new token: TOKEN, prefix: '!'

  @bot.include! GameCommands
  @bot.include! DiceCommands

  @bot.run
end
