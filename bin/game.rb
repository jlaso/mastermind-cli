require_relative '../lib/mastermind_game_cli/game'
require 'colorize'

puts 'Welcome to mastermind!'

num_pos = 0

until num_pos > 3 and num_pos < 10 do
  puts 'How many numbers do you want to have the sequence?'
  num_pos = gets.chomp.to_i
end

def help
  puts ''
  puts '================================'
  puts '| This is the help you can get |'
  puts '*==============================*'
  puts '| /help => this help screen    |'
  puts '| /exit => abandon             |'
  puts '| /show => show the board again|'
  puts '| /surrender => surrender      |'
  puts '| /mark n => appearances of n  |'
  puts '| /hint => ask for a hint      |'
  puts '================================'
  puts ''
end

puts "Great, you selected #{num_pos}, hold on please!"

help

game = MastermindGameCli::Game.new(num_pos)

until game.finished? do
  puts 'Try a guess!  (^C to exit)'.blue.on_white
  guess = gets.chomp

  if guess[0] == '/'
    command = guess.downcase[1..guess.length]
    command = command.split(' ')
    args = command[1..command.length]
    command = command[0]
    case command
      when 'help'
        help
      when 'show'
        game.pretty_print
      when 'surrender'
        puts "This is the sequence I thought '#{game.sequence.value}'"
        Kernel.exit
      when 'exit'
        Kernel.exit
      when 'hint'
        begin
          game.add_hint
          game.pretty_print
        rescue Exception => e
          puts e.message
        end
      when 'mark'
        if args[0].nil?
          puts 'mark should have a number (syntax is /mark n)'
        else
          game.mark = args[0]
          game.pretty_print
        end
      else
        puts "I don't understand '#{command}'. (Hint: ask for /help)"
    end
  else
    begin
      game.guess(guess)
      game.pretty_print

    rescue Exception => e
      puts "error> #{e.message}"
    end
  end
end

puts 'You win, congratulations!'
