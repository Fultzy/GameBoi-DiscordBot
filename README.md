# GameBoi Discord Bot
A modular discord bot for running your own home brew games and custom commands, with Ruby!

This bot is meant for personal use...

## Description
The purpose of this bot is primarily to share the games I've made in ruby with my friends on discord. In a way, to enable online multiplayer of simple board game style games. This bot was created with turn based games in mind, there may be more functionality built in later on but for now, keep it simple.

## Getting Started

### Dependencies
* Ruby ~> v2.6+
* Discordrb ~> v3.4.0

### Installing
* Clone this repository from `git@github.com:Fultzy/GameBoi-DiscordBot.git`

* List bundle install for Discordrb HERE..

* Retrieve your bot's token from the [Discord Dev Portal](https://discord.com/developers/applications) and add it to the `config.rb` file. Here as well you can fill out the Client_id and Owner_id, but these are not required for personal use. 

#### Command Prefix
* You can change the bot's command prefix from within `lib/bot.rb`
  ```ruby
  bot = Discordrb::Commands::CommandBot.new token: TOKEN, prefix: '!'
  ```

#### Commands
* Implementing commands are done simply by creating a module using the below as a template and placing that file into `lib/GameBoi/Commands`
  ```ruby
  module ModuleName
    extend Discordrb::Commands::CommandContainer

    # => change the command_name to what you want the event trigger to be
    command(:command_name, description: 'Description here! WOW!',
            usage: '!command_name example') do |event, *args|

      # => function goes here!!

    end
  end
  ```

 * You can use `Commands/DiceCommands` as an example. You can also find more examples from [Discordrd](https://github.com/shardlab/discordrb/tree/main/examples)

#### Ruby Games
* Installing games may be a little more complicated. The file to run the game must be the exact same as the folder inside of `GameBoi/Games`.
    For example: TicTacToe's folder name is `TicTacToe` and the file to run the game is `TicTactoe.rb`.

* Game loop setup directions go HERE.. UNDER CONSTRUCTION

* You can use `Games/TicTacToe` as an example

### Executing program

* Navigate to `/GameBoi_bot` and run `ruby lib/bot.rb` within a terminal
  This will start a Discordrb web-socket, if all goes well your bot should respond to commands in discord.

    if not, be sure that:
    * Your bot's `token` is correct and being used correctly
    * Your command modules are correctly `required` & `bot.include!`'ed

## Road map
* 1: make bot go BRR

## Related documentation
* [Discordrb](https://github.com/shardlab/discordrb)
* [Discordrb Documentation](http://discordrb.github.io/discordrb/master/Discordrb.html) <- more in depth
* [Discord Dev Docs](https://discord.com/developers/docs/intro)


## Big-Ups to:
* [Discordrb](https://github.com/shardlab/discordrb) and everyone who's contributed. Go check out their [Discord channel](https://discord.gg/cyK3Hjm)
