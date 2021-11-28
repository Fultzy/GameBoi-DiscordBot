module DiceCommands
  extend Discordrb::Commands::CommandContainer

  # A simple dice roll command, use it like: '!roll 2d10'
  command(:roll, description: 'rolls some dice',
              usage: 'roll NdS', min_args: 1) do |event, dnd_roll|
    number, sides = dnd_roll.split('d')
    next 'Invalid syntax.. try: `roll 2d10`' unless number && sides

    begin
      number = Integer(number, 10)
      sides  = Integer(sides, 10)
    rescue ArgumentError
      next 'You must pass two *numbers*.. try: `roll 2d10`'
    end

    "#{event.user.name} rolled: `#{rolls = Array.new(number) { rand(1..sides) }}`, total: `#{rolls.sum}`"
  end
end
