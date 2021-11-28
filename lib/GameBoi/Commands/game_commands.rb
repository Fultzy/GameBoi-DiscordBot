module GameCommands
  extend Discordrb::Commands::CommandContainer


  # Temperarily
  @game_list = ['TicTacToe', 'Hangman']
  @max_list = [2, 1]

  # needs global Emoji
  CROSS_MARK = "\u274c"
  CHECK_MARK = "\u2705"

  puts "Games Installed #{@game_list}"

  # => !play command: begins a new game selected from the list above.
  # when additional arguments are givin other players are invited
  # Also allows other users to fill empty slots
  command(:play, description:
          'A playable Mini-board-game library for discord!',
          usage: '!play N @player2, @player3, @player4',
          min_args: 1) do |event, *args|

    players = [event.user.mention].concat(args[1..-1])
    game_select = @game_list[args[0].to_i - 1]
    max_players = @max_list[args[0].to_i - 1]
    adds = max_players.to_i - players.size


      # => Challange message with react "buttons" to accept or decline invite
      # responding to game requests per: max players vs requested players
      # returning a invite message or an error message
    if players.size <= max_players
      case players.size
      when 1
        responce = "#{players[0]} is starting a game of #{game_select}"
      when 2
        responce = "#{players[0]} is challanging #{players[1]} to #{game_select}"
      when 3
        responce = "#{players[0]} is starting a game of #{game_select} against #{players[1]} and #{players[2]}"
      when 4
        responce = "#{players[0]} is starting a game of #{game_select} against #{players[1]}, #{players[2]} and #{players[3]}"
      end

      event.respond(adds > 0 ? responce.concat(", #{adds > 1 ? "#{adds} players" : '1 player'} can join") : responce)
    else
      event.respond("Too many players invited, #{game_select} plays  #{max_players} players")

    end
  end

  # display installed games
  # idea: on call send message asking for amount of players
  # Using reactions to disply 1, 2, or 4 player games
  command(:games, description: 'Lists all available games') do |event|
    count = 0
    event << ':video_game: List of available games :video_game:'
    @game_list.each { |g| event << ("  #{count += 1}: #{g}") }
    "le' fin :thumbsup:"
  end
end
